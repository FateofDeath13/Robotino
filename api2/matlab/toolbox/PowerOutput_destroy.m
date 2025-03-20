%% PowerOutput_destroy
% Destroys the PowerOutput object assigned to PowerOutputId.
%% Function
% |[ success ] = PowerOutput_destroy( PowerOutputId )|
%
% PowerOutputId is the id of the PowerOutput object to be destroyed.
%% Example Usage
% |success = PowerOutput_destroy( 0 )|
function [ success ] = PowerOutput_destroy( PowerOutputId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','PowerOutput_destroy', PowerOutputId ) );
end;