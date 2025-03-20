%% DigitalInput_setComId
% Associate a DigitalInput object with a communication interface
% Bind the DigitalInput to a specific Robotino.
%% Function 
% |[ success ] = DigitalInput_setComId( DigitalInputId, ComId )|
%
% DigitalInputId is the id of the DigitalInput object
%
% ComId is the communication id
%% Example Usage 
% |success = DigitalInput_setComId( 0, 0 )|
%% See also
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ success ] = DigitalInput_setComId( DigitalInputId, ComId ) 
if ( init )
    success = logical( calllib( 'rec_robotino_api2','DigitalInput_setComId', DigitalInputId, ComId ) );
end;