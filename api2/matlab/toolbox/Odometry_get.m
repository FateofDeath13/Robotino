%% Odometry_get
%% Function
% |[ x, y, phi ] = Odometry_get( OdometryId )|
%
% Returns the global x, y position and phi orientation of Robotino.
% x and y are in mm and phi is in degrees.
%
% OdometryId is the id of the Odometry object.
%% Example Usage 
% |[ x, y, phi ] = Odometry_get( 0 )|
function [ x, y, phi ] = Odometry_get( OdometryId )
if ( init )
    x = calllib( 'rec_robotino_api2','Odometry_x', OdometryId );
    y = calllib( 'rec_robotino_api2','Odometry_y', OdometryId );
    phi = calllib( 'rec_robotino_api2','Odometry_phi', OdometryId );
end;