%% AnalogInput_destroy
% Destroy the AnalogInput object assigned to AnalogInputId
%% Function 
% |[ success ] = AnalogInput_destroy( AnalogInputId )|
%% Example Usage 
% |success = AnalogInput_destroy( 0 )|
%% See also
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
function [ success ] = AnalogInput_destroy( AnalogInputId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','AnalogInput_destroy', AnalogInputId ) );
end;