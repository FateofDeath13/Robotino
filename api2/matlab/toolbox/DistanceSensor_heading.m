%% DistanceSensor_heading
%% Function 
% |[ heading ] = DistanceSensor_heading( DistanceSensorId )|
%
% Returns the heading of a DistanceSensor
%
% DistanceSensorId is the id of the DistanceSensor object
%% Example Usage 
% |heading = DistanceSensor_heading( 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
function [ heading ] = DistanceSensor_heading( DistanceSensorId )
if ( init )
    heading = calllib( 'rec_robotino_api2','DistanceSensor_heading', DistanceSensorId );
end;