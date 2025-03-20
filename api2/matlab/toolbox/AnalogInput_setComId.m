%% AnalogInput_setComId
% Associate an AnalogInput object with a communication interface
% Bind the AnalogInput to a specific Robotino.
%% Function 
% |[ success ] = AnalogInput_setComId( AnalogInputId, ComId )|
%
% ComId is the communication id.
%
% AnalogInputId is the id of the AnalogInput object.
%% Example Usage 
% |success = AnalogInput_setComId( 0, 0 )|
%% See also
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
function [ success ] = AnalogInput_setComId( AnalogInputId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','AnalogInput_setComId', AnalogInputId, ComId ) );
end;