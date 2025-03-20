%% Relay_setComId
% Associate a Relay object with a communication interface.
% Bind the Relay object to a specific Robotino.
%% Function 
% |[ success ] = Relay_setComId( RelayId, ComId )|
%
% RelayId is the id of the Relay object.
% 
% ComId is the communication id.
%% Example Usage
% |success = Relay_setComId( 0, 0 )|
function [ success ] = Relay_setComId( RelayId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Relay_setComId', RelayId, ComId ) );
end;