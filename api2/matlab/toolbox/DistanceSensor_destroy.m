%% DistanceSensor_destroy
% Destroy the DistanceSensor object assigned to DistanceSensorId
%% Function 
% |[ success ] = DistanceSensor_destroy( DistanceSensorId )|
%
% DistanceSensorId is the id of the DistanceSensor object
%% Example Usage 
% |success = DistanceSensor_destroy( 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
function [ success ] = DistanceSensor_destroy( DistanceSensorId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','DistanceSensor_destroy', DistanceSensorId ) );
end;