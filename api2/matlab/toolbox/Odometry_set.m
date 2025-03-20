%% Odometry_set
% Sets Robotino's odometry to the given coordinates
%% Function 
% |[ success ] = Odometry_set( OdometryId, x, y, phi )|
%
% OdometryId is the id of the Odometry object.
%
% x is the global x position in mm.
%
% y is the global y position in mm.
%
% phi is the global phi position in degrees.
%% Example Usage 
% |success = Odometry_set( 0, 2.5, 8.6, 45 )|
function [ success ] = Odometry_set( OdometryId, x, y, phi )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Odometry_set', OdometryId, x, y, phi ) );
end;