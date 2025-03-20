%% Bumper_value
%% Function 
% |[ value ] = Bumper_value( BumperId )|
% 
% Returns the current state of the bumper
%
% BumperId is the id of the bumper
%% Example Usage
% |value = Bumper_value( 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ value ] = Bumper_value( BumperId )
if ( init )
    value = logical( calllib( 'rec_robotino_api2','Bumper_value', BumperId ) );
end;