%% Odometry_destroy
% Destroys the Odometry object assigned to OdometryId
%% Function
% |[ success ] = Odometry_destroy( OdometryId )|
%
% OdomertyId is the id of the Odometry object to be destroyed.
%% Example Usage 
% |success = Odometry_destroy( 0 )|
function [ success ] = Odometry_destroy( OdometryId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Odometry_destroy', OdometryId ) );
end;