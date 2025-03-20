%% EncoderInput_resetPosition
% Sets the current position to zero
%% Function 
% |[ success ] = EncoderInput_resetPosition( EncoderInputId )|
%
% EncoderInputId is the id of the EncoderInput object
%% Example Usage 
% |success = EncoderInput_resetPosition( 0 )|
function [ success ] = EncoderInput_resetPosition( EncoderInputId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','EncoderInput_resetPosition', EncoderInputId ) );
end;