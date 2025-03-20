%% PowerOutput_setComId
% Associate a PowerOutput object with a communication interface.
% Bind the PowerOutput object to a specific Robotino.
%% Function 
% |[ success ] = PowerOutput_setComId( PowerOutputId, ComId )|
%
% PowerOutputId is the id of the PowerOutput object.
%
% ComId is the communication id.
%% Example Usage
% |success = PowerOutput_setComId( 0, 0 )|
function [ success ] = PowerOutput_setComId( PowerOutputId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','PowerOutput_setComId', PowerOutputId, ComId ) );
end;