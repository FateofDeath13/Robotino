%% NorthStar_magSpot0( NorthStarId )
%
% Returns the signal strenght of spot 1.
%% Function
% |[ magSpot0 ] = NorthStar_magSpot0( NorthStarId )|
%
% NorthStarId is the id of the NorthStar object.
%% Example Usage
%
% |magSpot0 = NorthStar_magSpot0( 0 )|
function [ magSpot0 ] = NorthStar_magSpot0( NorthStarId )
if ( init )
    magSpot0 = calllib( 'rec_robotino_api2','NorthStar_magSpot0', NorthStarId );
end;
