%% DigitalInput_value
%% Function
% |[ value ] = DigitalInput_value( DigitalInputId )|
%
% Returns the current value of the specified DigitalInput device
%
% DigitalInputId is the id of the DigitalInput device

%% Example Usage
% |value = DigitalInput_value( 0 )|
%% See also
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ value ] = DigitalInput_value( DigitalInputId )
if ( init )
    value = calllib( 'rec_robotino_api2','DigitalInput_value', DigitalInputId );
end;