%% PowerOuput_current
%% Function 
% |[ current ] = PowerOutput_current( PowerOutputId )|
%
% Returns the current delivered by the power output in A.
%
% PowerOutputId is the id of the PowerOutput object.
%% Example Usage 
% |current = PowerOutput_current( 0 )|
function [ current ] = PowerOutput_current( PowerOutputId )
if ( init )
    current = calllib( 'rec_robotino_api2','PowerOutput_current', PowerOutputId );
end;