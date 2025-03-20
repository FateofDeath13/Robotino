%% NorthStar_setComId
% Associate a NorthStar object with a communication interface.
% Bind the NorthStar object to a specific Robotino.
%% Function 
% |[ success ] = NorthStar_setComId( NorthStarId, ComId )|
%
% NorthStarId is the id of the NorthStar object.
%
% ComId is the communication id.
%% Example Usage
% |success = NorthStar_setComId( 0, 0 )|
function [ success ] = NorthStar_setComId( NorthStarId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','NorthStar_setComId', NorthStarId, ComId ) );
end;
