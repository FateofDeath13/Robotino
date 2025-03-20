%% NorthStar_posTheta( NorthStarId )
%
% Returns the current orientation in radians.
%% Function
% |[ posTheta ] = NorthStar_posTheta( NorthStarId )|
%
% NorthStarId is the id of the NorthStar object.
%% Example Usage
%
% |posTheta = NorthStar_posTheta( 0 )|
function [ posTheta ] = NorthStar_posTheta( NorthStarId )
if ( init )
    posTheta = calllib( 'rec_robotino_api2','NorthStar_posTheta', NorthStarId );
end;
