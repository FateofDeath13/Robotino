%% DistanceSensor_voltage
%% Function 
% |[ voltage ] = DistanceSensor_voltage( DistanceSensorId )|
%
% Returns the voltage value of the specified DistanceSensor device
%
% DistanceSensorId is the id of the DistanceSensor
%% Example Usage 
% |voltage = DistanceSensor_voltage( 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
function [ voltage ] = DistanceSensor_voltage( DistanceSensorId )
if ( init )
    voltage = calllib( 'rec_robotino_api2','DistanceSensor_voltage', DistanceSensorId );
end;