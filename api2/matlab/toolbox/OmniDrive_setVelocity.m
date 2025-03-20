%% OmniDrive_setVelocity
% Drive Robotino.
%% Function 
% |[ success ] = OmniDrive_setVelocity( OmniDriveId, Vx, Vy, Omega )|
%
% OmniDriveId is the id of the OmniDrive object.
%
% Vx is the velocity in the x direction in m/s.
%
% Vy is the velocity in the y direction in m/s.
%
% Omega is the angular velocity in rad/s.
%% Example Usage 
% |success = OmniDrive_setVelocity( 0, 100, 0, 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ success ] = OmniDrive_setVelocity( OmniDriveId, Vx, Vy, Omega )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','OmniDrive_setVelocity', OmniDriveId, Vx, Vy, Omega ) );
end;