%% DigitalInput_construct
% Construct a DigitalInput object

%% Function 
% |[ DigitalInputId ] = DigitalInput_construct( n )|
%
% Returns the DigitalInputId of the newly constructed DigitalInput object of 
% number n
%% Example Usage
% |DigitalInputId = DigitalInput_construct( 0 )|
%% See also
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ DigitalInputId ] = DigitalInput_construct( n )
if ( init )
    DigitalInputId =  calllib( 'rec_robotino_api2','DigitalInput_construct', n );  
end;