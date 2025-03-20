// #include <string>
// #include <iostream>
// #include <Com.h>
// #include "Robot.h"

// int main(int argc, char **argv){
//     // connect to robot with IP which was specified as program's command
//     // line argument or to 192.168.0.100 if no argument was provided
//     Com com;
//     //setting Robotino's IP
//     if(argc > 1){
//         com.setAddress(argv[1]);
//         std::cout << "Trying to connect to " << argv[1] << "..." << std::endl;
//     }
//     else{
//         com.setAddress("192.168.0.100");
//         std::cout << "Trying to connect to 192.168.0.100..." << std::endl;
//     }
//     //try to connect
//     try{
//         com.connectToServer(true);
//         std::cout << "Successfully connected!" << std::endl;
//     }
//     catch(...){
//         std::cout << "Unable to connect! Program stopped." << std::endl;
//         return 0;
//     }

//     Robot robot(com);

//     float goal_x, goal_y;
//     while(true){
//         std::cout << "Specify coordinates of new goal point in meters:" << std::endl;
//         std::cout << "x = ";
//         std::cin >> goal_x;
//         std::cout << "y = ";
//         std::cin >> goal_y;

//         std::cout << "Robot is moving to (" << goal_x << ", " << goal_y << ") point..."  << std::endl;
//         try{
//             robot.moveTo(goal_x, goal_y);
//             std::cout << "Goal was achieved!" << std::endl;
//         }
//         catch(std::string error){
//             std::cout << "Goal wasn't achieved due to this problem: " << error << std::endl;
//             if(error == "Bumper was pressed!")
//                 break;
//         }
//     }

//     std::cout << "Program stopped." << std::endl;
//     com.disconnectFromServer();
//     return 0;
// }

#include <iostream>
#include "rec/robotino/api2/all.h"
rec::robotino::api2::Com com;
rec::robotino::api2::Bumper bumper;
int main( int argc, char **argv )
{
  std::string hostname = "192.16.0.1";
  if( argc > 1 )
  {
    hostname = argv[1];
  }
  com.setAddress( hostname.c_str() );
  com.connectToServer( true );
  while(com.isConnected() && false == bumper.value())
  {
    std::cout << "Bumper is " << (bumper.value()?"":"not") << " pressed" << std::endl;
    com.processEvents();
    rec::robotino::api2::msleep( 100 );
  }
  com.disconnectFromServer();
  rec::robotino::api2::shutdown();
  return 0;
}