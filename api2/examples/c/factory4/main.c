//  Copyright (C) 2004-2008, Robotics Equipment Corporation GmbH

#define _USE_MATH_DEFINES
#include <math.h>
#include <stdio.h>
#include <stdlib.h>
#include <string.h>

#include "rec/robotino/api2/c/Com.h"
#include "rec/robotino/api2/c/Factory4.h"

#ifdef WIN32
#include <windows.h>
// _getch
#include <conio.h>
#else
// getchar
#include <stdio.h>
// usleep
#include <unistd.h>
#endif

#ifdef WIN32
#include <windows.h>
#include <stdio.h>
#else
#include <signal.h>
#endif

int _run = 1;

#ifdef WIN32 
static BOOL WINAPI sigint_handler( DWORD fdwCtrlType ) 
{ 
	switch( fdwCtrlType ) 
	{  
	case CTRL_C_EVENT: // Handle the CTRL-C signal.
		_run = 0;
		return TRUE;

	default: 
		return FALSE; 
	} 
} 
#else
void sigint_handler( int signum )
{
	_run = 0;
}
#endif

ComId com;
Factory4Id factory4;
BumperId bumper;

void msleep( unsigned int ms )
{
#ifdef WIN32
	SleepEx( ms, FALSE );
#else
	usleep( ms * 1000 );
#endif
}

void waitForKey()
{
#ifdef WIN32
	_getch();
#else
	getchar();
#endif
}

void drive()
{
	unsigned int msecsElapsed = 0;

	while( Com_isConnected( com ) && FALSE == Bumper_value( bumper ) && _run )
	{
		msleep( 1000 );
		msecsElapsed += 1000;

		Factory4_processEvents(factory4);

		printf("elapsed %u\n", msecsElapsed);
	}
}

void error( const char* message )
{
	printf( "%s\n", message );
	printf( "Press any key to exit..." );
	waitForKey();
	exit( 1 );
}

void mapEventCb(const char* data, int dataSize, int width, int height, int resolution, int offsetx, int offsety, int sequence)
{
	printf("mapEventCb dataSize:%d width:%d height:%d", dataSize, width, height);
}

int main( int argc, char **argv )
{

#ifdef WIN32
	SetConsoleCtrlHandler( (PHANDLER_ROUTINE) sigint_handler, TRUE );
#else
	struct sigaction act;
	memset( &act, 0, sizeof( act ) );
	act.sa_handler = sigint_handler;
	sigaction( SIGINT, &act, NULL );
#endif

	com = Com_construct();

	if( argc > 1 )
	{
		Com_setAddress( com, argv[1] );
	}
	else
	{
		//Com_setAddress( com, "172.26.1.1" );
		Com_setAddress( com, "192.168.1.242" );
	}

	if( FALSE == Com_connect( com ) )
	{
		error( "Error on connect" );
	}
	else
	{
		char addressBuffer[256];
		Com_address( com, addressBuffer, 256 );
		printf( "Connected to %s\n", addressBuffer );
	}

	factory4 = Factory4_construct();
	Factory4_setComId(factory4, com);

	Factory4_setMapEventCb(factory4, mapEventCb);

	bumper = Bumper_construct();
	Bumper_setComId( bumper, com );

	drive();

	Factory4_destroy(factory4);
	Bumper_destroy( bumper );
	Com_destroy( com );

	printf( "Press any key to exit...\n" );

	waitForKey();
}
