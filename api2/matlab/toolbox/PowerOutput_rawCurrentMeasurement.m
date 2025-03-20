%% PowerOutput_rawCurrentMeasurement
% Returns the current delivered by the power output. Range from 0 - 1023.
%% Function 
% |[ current ] = PowerOutput_rawCurrentMeasurment( PowerOutputId )|
%
% PowerOutputId is the id of the PowerOutput object.
%% Example Usage 
% |current = PowerOutput_rawCurrentMeasurment( 0 )|
function [ current ] = PowerOutput_rawCurrentMeasurment( PowerOutputId )
if ( init )
    current = calllib( 'rec_robotino_api2','PowerOutput_rawCurrentMeasurment', PowerOutputId );
end;