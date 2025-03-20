%% NorthStar_numSpotsVisible( NorthStarId )
%
% Returns the number of spots visible.
%% Function
% |[ numSpotsVisible ] = NorthStar_numSpotsVisible( NorthStarId )|
%
% NorthStarId is the id of the NorthStar object.
%% Example Usage
%
% |numSpotsVisible = NorthStar_numSpotsVisible( 0 )|
function [ numSpotsVisible ] = NorthStar_numSpotsVisible( NorthStarId )
if ( init )
    numSpotsVisible = calllib( 'rec_robotino_api2','NorthStar_numSpotsVisible', NorthStarId );
end;
