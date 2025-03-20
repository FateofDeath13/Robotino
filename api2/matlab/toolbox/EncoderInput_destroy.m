%% EncoderInput_destroy
% Destroy the EncoderInput object assigned to EncoderInputId
%% Function 
% |[ success ] = EncoderInput_destroy( EncoderInputId )|
%
% EncoderInputId is the id of the EncoderInput object
%% Example Usage 
% |success = EncoderInput_destroy( 0 )|
function [ success ] = EncoderInput_destroy( EncoderInputId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','EncoderInput_destroy', EncoderInputId ) );
end;