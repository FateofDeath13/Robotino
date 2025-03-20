%% Com_setAddress
% Set the address of Robotino through which the ComId communicates
%% Function 
% |[ success ] = Com_setAddress( ComId, Address )|
%
% ComId is the id of the Com object
%
% Address is the IP address of the robot (along with the port number)
%% Example Usage 
% |success = Com_setAddress( 0, '127.0.0.1' )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
% <example_matlab_Manipulator.html Manipulator Example>
function [ success ] = Com_setAddress( ComId, Address )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Com_setAddress', ComId, Address ) );
end;