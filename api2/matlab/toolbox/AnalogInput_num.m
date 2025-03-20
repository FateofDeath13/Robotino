%% AnalogInput_num
%% Function 
% |[ num ] = AnalogInput_num|
%
% Returns the number of analog inputs.
%% Example Usage 
% |num = AnalogInput_num|
%% See also
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
function [ num ] = AnalogInput_num
if ( init )
    num =  calllib( 'rec_robotino_api2','numAnalogInputs' );  
end;