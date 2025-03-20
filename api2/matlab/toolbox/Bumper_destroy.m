%% Bumper_destroy
% Destroy the Bumper object assigned to a BumperId

%% Function 
% |[ success ] = Bumper_destroy( BumperId )|
% 
% BumperId is the id of the Bumper object to be destroyed
%% Example 
% |success = Bumper_destroy( 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ success ] = Bumper_destroy( BumperId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Bumper_destroy', BumperId ) );
end;