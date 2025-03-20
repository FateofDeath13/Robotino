%% Relay_setValue
% Sets the setpoint speed of a relay.

%% Function 
% |[ success ] = Relay_setValue( RelayId, On )|
%
% RelayId is the id of the Relay object.
%
% On is the boolean value (1 or 0) that the Relay will be set to.
%% Example Usage
% |success = Relay_setValue( 0, 1 )|
function [ success ] = Relay_setValue( RelayId, On )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Relay_setValue', RelayId, logical( On ) ) );
end;