%% NorthStar_roomId
%
% Returns the Id of the current room.
%% Function
% |[ roomId ] = NorthStar_roomId( NorthStarId )|
%
% NorthStarId is the id of the NorthStar object.
%% Example Usage
%
% |roomId = NorthStar_roomId( 0 )|
function [ roomId ] = NorthStar_roomId( NorthStarId )
if ( init )
    roomId = calllib( 'rec_robotino_api2','NorthStar_roomId', NorthStarId );
end;
