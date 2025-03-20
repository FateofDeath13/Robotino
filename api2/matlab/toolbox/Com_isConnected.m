%% Com_isConnected
% Check if the communication is established

%% Function 
% |[ isConnected ] = Com_isConnected( ComId )|
%
% ComId is the id of the Com object
%% Example Usage
% |isConnected = Com_isConnected( 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
% <example_matlab_Manipulator.html Manipulator Example>
function [ isConnected ] = Com_isConnected( ComId )
if ( init )
    isConnected = logical( calllib( 'rec_robotino_api2', 'Com_isConnected', ComId ) );
end;