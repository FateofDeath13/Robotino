%% NorthStar_magSpot1( NorthStarId )
%
% Returns the signal strenght of spot 2.
%% Function
% |[ magSpot1 ] = NorthStar_magSpot1( NorthStarId )|
%
% NorthStarId is the id of the NorthStar object.
%% Example Usage
%
% |magSpot1 = NorthStar_magSpot1( 0 )|
function [ magSpot1 ] = NorthStar_magSpot1( NorthStarId )
if ( init )
    magSpot1 = calllib( 'rec_robotino_api2','NorthStar_magSpot1', NorthStarId );
end;
