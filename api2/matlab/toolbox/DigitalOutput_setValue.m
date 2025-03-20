%% DigitalOutput_setValue
% Sets the value of the specified output device

%% Function 
% |[ success ] = DigitalOutput_setValue( DigitalOutputId, On )|
% 
% DigitalOutputId is the id of the DigitalOutput device
%
% On is the value to be set. It can be either true (1) or false (0).
%% Example Usage 
% |success = DigitalOutput_setValue( 0, 1 )|
function [ success ] = DigitalOutput_setValue( DigitalOutputId, On )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','DigitalOutput_setValue', DigitalOutputId, logical( On ) ) );
end;