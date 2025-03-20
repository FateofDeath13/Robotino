%% EncoderInput_position
%% Function 
% |[ position ] = EncoderInput_position( EncoderInputId )|
%
% Returns the actual position in ticks since power on or
% <EncoderInput_resetPosition.html EncoderInput_resetPosition>
%
% EncoderInputId is the id of the EncoderInput object

%% Example Usage 
% |position = EncoderInput_position( 0 )|
function [ position ] = EncoderInput_position( EncoderInputId )
if ( init )
    position = calllib( 'rec_robotino_api2','EncoderInput_position', EncoderInputId );
end;