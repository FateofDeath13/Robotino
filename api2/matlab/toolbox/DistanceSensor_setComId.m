%% DistanceSensor_setComId
% Associate a DistanceSensor object with a communication interface
% Bind the DistanceSensor to a specific Robotino.
%% Function 
% |[ success ] = DistanceSensor_setComId( DistanceSensorId, ComId )|
%
% DistanceSensorId is the id of the DistanceSensor object
%
% ComId is the communication id.
%% Example Usage 
% |success = DistanceSensor_setComId( 0, 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
function [ success ] = DistanceSensor_setComId( DistanceSensorId, ComId ) 
if ( init )
    success = logical( calllib( 'rec_robotino_api2','DistanceSensor_setComId', DistanceSensorId, ComId ) );
end;