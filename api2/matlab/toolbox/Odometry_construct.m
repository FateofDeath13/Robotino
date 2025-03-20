%% Odometry_construct
% Constructs an Odometry object.
%% Function 
% |[ OdometryId ] = Odometry_construct|
%
% Returns an OdometryId which is the id of the newly constructed Odometry
% object.
%% Example Usage 
% |OdometryId = Odometry_construct|
function [ OdometryId ] = Odometry_construct
if ( init )
    OdometryId =  calllib( 'rec_robotino_api2','Odometry_construct');  
end;