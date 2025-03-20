%% EncoderInput_setComId
% Associate a EncoderInput object with a communication interface
% Bind the EncoderInput object to a specific Robotino.
%% Function 
% |[ success ] = EncoderInput_setComId( EncoderInputId, ComId )|
%
% EncoderInputId is the id of the EncoderInput object
%
% ComId is the communication id.
%% Example Usage 
% |success = EncoderInput_setComId( 0, 0 )|
function [ success ] = EncoderInput_setComId( EncoderInputId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','EncoderInput_setComId', EncoderInputId, ComId ) );
end;