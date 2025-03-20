%% DigitalOutput_construct
% Construct a DigitalOutput object
%% Function 
% |[ DigitalOutputId ] = DigitalOutput_construct( n )|
%
% Returns the DigitalOutputId of the newly constructed DigitalOutput object of 
% number n
%% Example Usage 
% |DigitalOutputId = DigitalOutput_construct( 0 )|

function [ DigitalOutputId ] = DigitalOutput_construct( n )
if ( init )
    DigitalOutputId =  calllib( 'rec_robotino_api2','DigitalOutput_construct', n );  
end;