%% EncoderInput_velocity
%% Function 
% |[ velocity ] = EncoderInput_velocity( EncoderInputId )|
%
% Returns the actual velocity in ticks/s
%
% EncoderInputId is the id of the EncoderInput object
%% Example Usage 
% |velocity = EncoderInput_velocity( 0 )|

function [ velocity ] = EncoderInput_velocity( EncoderInputId )
if ( init )
    velocity = calllib( 'rec_robotino_api2','EncoderInput_velocity', EncoderInputId );
end;