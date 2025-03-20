%% AnalogInput_value
%% Function 
% |[ value ] = AnalogInput_value( AnalogInputId )|
%
% Returns the current value of the specified AnalogInput device.
%
% AnalogInputId is the id of the AnalogInput device.
%% Example Usage 
% |value = AnalogInput_value( 0 )|
%% See also
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
function [ value ] = AnalogInput_value( AnalogInputId )
if ( init )
    value = calllib( 'rec_robotino_api2','AnalogInput_value', AnalogInputId );
end;