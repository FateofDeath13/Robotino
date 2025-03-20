%% NorthStar_posX( NorthStarId )
%
% Returns the current position in the x direction. The scale depends on the
% calibration.
%% Function
% |[ posX ] = NorthStar_posX( NorthStarId )|
%
% NorthStarId is the id of the NorthStar object.
%% Example Usage
%
% |posX = NorthStar_posX( 0 )|
function [ posX ] = NorthStar_posX( NorthStarId )
if ( init )
    posX = calllib( 'rec_robotino_api2','NorthStar_posX', NorthStarId );
end;
