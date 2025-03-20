%% EncoderInput_construct
% Construct an EncoderInput object
%% Function 
% |[ EncoderInputId ] = EncoderInput_construct( n )|
%
% Returns the EncoderInputId of the newly constructed EncoderInput object of 
% number n
%% Example Usage 
% |EncoderInputId = EncoderInput_construct( 0 )|
function [ EncoderInputId ] = EncoderInput_construct
if ( init )
    EncoderInputId =  calllib( 'rec_robotino_api2','EncoderInput_construct');  
end;