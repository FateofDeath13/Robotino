%% NorthStar_posY( NorthStarId )
%
% Returns the current position in the y direction. The scale depends on the
% calibration.
%% Function
% |[ posY ] = NorthStar_posY( NorthStarId )|
%
% NorthStarId is the id of the NorthStar object.
%% Example Usage
%
% |posY = NorthStar_posY( 0 )|
function [ posY ] = NorthStar_posY( NorthStarId )
if ( init )
    posY = calllib( 'rec_robotino_api2','NorthStar_posY', NorthStarId );
end;
