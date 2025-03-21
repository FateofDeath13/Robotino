//  Copyright (C) 2004-2008, Robotics Equipment Corporation GmbH

#define _USE_MATH_DEFINES
#include <cmath>
#include <iostream>
#include <stdlib.h>

#ifdef WIN32
#include <windows.h>
#include <stdio.h>
#else
#include <signal.h>
#endif

#include "rec/robotino/api2/all.h"
#include "rec/robotino/api2/Factory4.h"

using namespace rec::robotino::api2;

bool _run = true;

#ifdef WIN32 
static BOOL WINAPI sigint_handler( DWORD fdwCtrlType ) 
{ 
	switch( fdwCtrlType ) 
	{  
	case CTRL_C_EVENT: // Handle the CTRL-C signal.
		_run = false;
		return TRUE;

	default: 
		return FALSE; 
	} 
} 
#else
void sigint_handler( int signum )
{
	_run = false;
}
#endif

class MyCom : public Com
{
public:
	MyCom()
		: Com( "example_factory4" )
	{
	}

	void errorEvent( const char* errorString )
	{
		std::cerr << "Error: " << errorString << std::endl;
	}

	void connectedEvent()
	{
		std::cout << "Connected." << std::endl;
	}

	void connectionClosedEvent()
	{
		std::cout << "Connection closed." << std::endl;
	}

	void logEvent( const char* message, int level )
	{
		std::cout << message << std::endl;
	}
};

class MyBumper : public Bumper
{
public:
	MyBumper()
		: bumped( false )
	{
	}

	void bumperEvent( bool hasContact )
	{
		bumped |= hasContact;
		std::cout << "Bumper has " << ( hasContact ? "contact" : "no contact") << std::endl;
	}

	bool bumped;
};

class MyFactory4 : public Factory4
{
public:
	MyFactory4()
	{

	}

	void mapEvent(const char* data, unsigned int dataSize, const rec::robotino::api2::Factory4MapInfo& info)
	{
		std::cout << "mapEvent dataSize:" << dataSize << std::endl;
	}
};


MyCom com;
MyBumper bumper;
MyFactory4 factory4;

void init( const std::string& hostname )
{
	// Initialize the actors

	// Connect
	std::cout << "Connecting...";
	com.setAddress( hostname.c_str() );

	com.connectToServer( true );

	if( false == com.isConnected() )
	{
		std::cout << std::endl << "Could not connect to " << com.address() << std::endl;
#ifdef WIN32
		std::cout << "Press any key to exit..." << std::endl;
		rec::robotino::api2::waitForKey();
#endif
		rec::robotino::api2::shutdown();
		exit( 1 );
	}
	else
	{
		std::cout << "success" << std::endl;
	}
}

void drive()
{
	const float startVector[2] = {0.2f, 0.0f};
	float dir[2];
	float a = 0.0f;

	while( com.isConnected() && false == bumper.value() && _run )
	{
		com.processEvents();
		rec::robotino::api2::msleep( 100 );
	}
}

void destroy()
{
	com.disconnectFromServer();
}

int main( int argc, char **argv )
{
	std::string hostname = "192.168.1.242";
	if( argc > 1 )
	{
		hostname = argv[1];
	}

#ifdef WIN32
	::SetConsoleCtrlHandler( (PHANDLER_ROUTINE) sigint_handler, TRUE );
#else
	struct sigaction act;
	memset( &act, 0, sizeof( act ) );
	act.sa_handler = sigint_handler;
	sigaction( SIGINT, &act, NULL );
#endif

	try
	{
		init( hostname );
		drive();
		destroy();
	}
	catch( const rec::robotino::api2::RobotinoException& e )
	{
		std::cerr << "Com Error: " << e.what() << std::endl;
	}
	catch( const std::exception& e )
	{
		std::cerr << "Error: " << e.what() << std::endl;
	}
	catch( ... )
	{
		std::cerr << "Unknow Error" << std::endl;
	}

	rec::robotino::api2::shutdown();

#ifdef WIN32
	std::cout << "Press any key to exit..." << std::endl;
	rec::robotino::api2::waitForKey();
#endif
}
