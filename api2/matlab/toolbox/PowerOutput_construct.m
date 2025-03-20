%% PowerOutput_construct
% Constructs a PowerOutput object.
%% Function
% |[ PowerOutputId ] = PowerOutput_construct|
%
% Returns PowerOutputId which is the id of the newly constructed PowerOutput object.
%% Example Usage
% |PowerOutputId = PowerOutput_construct|
function [ PowerOutputId ] = PowerOutput_construct
if ( init )
    PowerOutputId =  calllib( 'rec_robotino_api2','PowerOutput_construct');  
end;