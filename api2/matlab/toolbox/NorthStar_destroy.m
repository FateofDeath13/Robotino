%% NorthStar_destroy
% Destroys the NorthStar object assigned to NorthStarId.
%% Function 
% |[ success ] = NorthStar_destroy( NorthStarId )|
%
% NorthStarId is the id of the NorthStar object to be destroyed.
%% Example Usage 
% |success = NorthStar_destroy( 0 )|
function [ success ] = NorthStar_destroy( NorthStarId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','NorthStar_destroy', NorthStarId ) );
end;
