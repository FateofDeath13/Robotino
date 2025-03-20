%% Relay_construct
% Constructs a Relay object of number n.
%% Function
% |[ RelayId ] = Relay_construct( n )|
%
% Returns a RelayId which is the id of the newly constructed Relay object.
% 
% n is number of the Relay.
%% Example Usage 
% |RelayId = Relay_construct( 0 )|
function [ RelayId ] = Relay_construct( n )
if ( init )
    RelayId =  calllib( 'rec_robotino_api2','Relay_construct', n );  
end;