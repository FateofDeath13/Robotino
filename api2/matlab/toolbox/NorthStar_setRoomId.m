%% NorthStar_setRoomId( NorthStarId, roomId )
%
% Sets the id of a room.
%% Function
% |[ success ] = NorthStar_setRoomId( NorthStarId, roomId )|
%
% NorthStarId is the id of the NorthStar object.
%
% roomId is the id of the room.
%% Example Usage
%
% |success = NorthStar_setRoomId( 0, 0)|
function [ success ] = NorthStar_setRoomId( NorthStarId, roomId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','NorthStar_setRoomId', NorthStarId, roomId ) );
end;
