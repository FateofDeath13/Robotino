%% DistanceSensor_num
%% Function 
% |[ num ] = DistanceSensor_num|
%
% Returns the number of distance sensors
%% Example Usage 
% |num = DistanceSensor_num|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
function [ num ] = DistanceSensor_num
if ( init )
    num =  calllib( 'rec_robotino_api2','numDistanceSensors' );  
end;