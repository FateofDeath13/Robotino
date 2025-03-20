%% DigitalOutput_num

%% Function 
% |[ num ] = DigitalOutput_num|
%
% Returns the number of digital outputs.
%% Example Usage 
% |num = DigitalOutput_num|
function [ num ] = DigitalOutput_num
if ( init )
    num =  calllib( 'rec_robotino_api2','numDigitalOutputs' );  
end;