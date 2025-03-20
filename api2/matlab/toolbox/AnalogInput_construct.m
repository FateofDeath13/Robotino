%% AnalogInput_Construct
% Construct an AnalogInput object
%% Function 
% |[ AnalogInputId ] = AnalogInput_construct( n )|
%
% Returns the AnalogInputId of the newly constructed AnalogInput object of 
% number n
%% Example Usage
% |AnalogInputId = AnalogInput_construct( 0 )|
%% See also
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
function [ AnalogInputId ] = AnalogInput_construct( n )
if ( init )
    AnalogInputId =  calllib( 'rec_robotino_api2','AnalogInput_construct', n );  
end;