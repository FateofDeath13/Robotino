%% Relay_destroy
% Destroys the Relay object assigned to RelayId.
%% Function 
% |[ success ] = Relay_destroy( RelayId )|
%
% RelayId is the id of the Relay object to be destroyed.
%% Example Usage 
% |success = Relay_destroy( 0 )|
function [ success ] = Relay_destroy( RelayId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Relay_destroy', RelayId ) );
end;