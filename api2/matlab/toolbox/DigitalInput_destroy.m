%% DigitalInput_destroy
% Destroy the DigitalInput object assigned to DigitalInputId
%% Function 
% |[ success ] = DigitalInput_destroy( DigitalInputId )|
%
% DigitalInputId is the id of the DigitalInput object
%% Example Usage
% |success = DigitalInput_destroy( 0 )|
%% See also
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ success ] = DigitalInput_destroy( DigitalInputId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','DigitalInput_destroy', DigitalInputId ) );
end;