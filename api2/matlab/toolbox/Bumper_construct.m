%% Bumper_construct

%% Function
% |[ BumperId ] = Bumper_construct|
% 
% Returns the BumperId of the newly constructed Bumper object

%% Example Usage 
% |BumperId = Bumper_construct|

%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>

function [ BumperId ] = Bumper_construct
if ( init )
    BumperId =  calllib( 'rec_robotino_api2','Bumper_construct' );
end;