%% DistanceSensor_construct
% Construct a DistanceSensor object

%% Function
% |[ DistanceSensorId ] = DistanceSensor_construct( n )|
%
% Returns the DistanceSensorId of the newly constructed DistanceSensor object of 
% number n
%% Example Usage 
% |DistanceSensorId = DistanceSensor_construct( 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
function [ DistanceSensorId ] = DistanceSensor_construct( n )
if ( init )
    DistanceSensorId =  calllib( 'rec_robotino_api2','DistanceSensor_construct', n );  
end;