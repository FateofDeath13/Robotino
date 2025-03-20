%% Odometry_setComId
% Associate a Odometry object with a communication interface
% Bind the Odometry object to a specific Robotino.
%% Function 
% |[ success ] = Odometry_setComId( OdometryId, ComId )|
%
% OdometryId is the id of the Odometry object.
%
% ComId is the communication id.
%% Example Usage 
% |success = Odometry_setComId( 0, 0 )|
function [ success ] = Odometry_setComId( OdometryId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Odometry_setComId', OdometryId, ComId ) );
end;