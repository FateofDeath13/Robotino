%% Relay_num
%% Function
% |[ num ] = Relay_num|
%
% Returns the number of drive relays on Robotino.
%% Example Usage
% |num = Relay_num|
function [ num ] = Relay_num
if ( init )
    num =  calllib( 'rec_robotino_api2','numRelays' );  
end;