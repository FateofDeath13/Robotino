%% DigitalInput_num
%% Function 
% |[ num ] = DigitalInput_num|
%
% Returns the number of digital inputs.
%% Example Usage
% |num = DigitalInput_num|
%% See also
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ num ] = DigitalInput_num
if ( init )
    num =  calllib( 'rec_robotino_api2','numDigitalInputs' );  
end;