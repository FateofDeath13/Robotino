%% OmniDrive_getVelocities
% Project the velocity of the robot in cartesian coordinates to single
% motor speeds.
%% Function
% |[ m1, m2, m3 ] = OmniDrive_getVelocities( OmniDriveId, vx, vy, omega )|
%
% OmniDriveId is the id of the OmniDrive object.
%
% vx is the velocity in the x direction in m/s.
%
% vy is the velocity in the y direction in m/s.
%
% omega is the angular velocity in rad/s.
%
% m1 is the resulting speed of motor 0 in rpm.
%
% m2 is the resulting speed of motor 1 in rpm.
%
% m3 is the resulting speed of motor 2 in rpm.
%% Example Usage
% |[ m1, m2, m3 ] = OmniDrive_getVelocities( 0, 50, 50, 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ m1, m2, m3 ] = OmniDrive_getVelocities( OmniDriveId, vx, vy, omega )
if ( init )
    m1_Buffer = single( zeros( 1, 1 ) );
    m1_BufferPtr = libpointer( 'singlePtr', m1_Buffer );
    m2_Buffer = single( zeros( 1, 1 ) );
    m2_BufferPtr = libpointer( 'singlePtr', m2_Buffer );
    m3_Buffer = single( zeros( 1, 1 ) );
    m3_BufferPtr = libpointer( 'singlePtr', m3_Buffer );
    calllib( 'rec_robotino_api2','OmniDrive_project', OmniDriveId, m1_BufferPtr, m2_BufferPtr, m3_BufferPtr, vx, vy, omega );
    m1 = double( get( m1_BufferPtr, 'Value' ) );
    m2 = double( get( m2_BufferPtr, 'Value' ) );
    m3 = double( get( m3_BufferPtr, 'Value' ) );
end;