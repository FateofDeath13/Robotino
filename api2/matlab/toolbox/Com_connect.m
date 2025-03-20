%% Com_connect
% Establish the communication with the robot 
% Make sure to call <Com_setAddress.html Com_setAddress> first
%% Function 
% |[ success ] = Com_connect( ComId )|
%
% ComId is the id of the Com object
%% Example Usage
% success = Com_connect( 0 )
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
% <example_matlab_Manipulator.html Manipulator Example>
function [ success ] = Com_connect( ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Com_connect', ComId ) );
end;
