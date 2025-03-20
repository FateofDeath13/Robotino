%% NorthStar_sequenceNo
%
% The sequence number is increased whenever the Northstar delivers new data.
%% Function
% |[ sequenceNo ] = NorthStar_sequenceNo( NorthStarId )|
%
% NorthStarId is the id of the NorthStar object.
%% Example Usage
%
% |sequenceNo = NorthStar_sequenceNo( 0 )|
function [ sequenceNo ] = NorthStar_sequenceNo( NorthStarId )
if ( init )
    sequenceNo = calllib( 'rec_robotino_api2','NorthStar_sequenceNo', NorthStarId );
end;
