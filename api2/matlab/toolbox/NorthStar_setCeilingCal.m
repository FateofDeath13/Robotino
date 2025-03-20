%% NorthStar_setCeilingCal( NorthStarId, ceilingCal )
%
% Sets the ceiling calibration.
%% Function
% |[ success ] = NorthStar_setCeilingCal( NorthStarId, ceilingCal )|
%
% NorthStarId is the id of the NorthStar object.
%
% ceilingCal is the ceiling calibration.
%% Example Usage
%
% |success = NorthStar_setCeilingCal( 0, 0)|
function [ success ] = NorthStar_setCeilingCal( NorthStarId, ceilingCal )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','NorthStar_setCeilingCal', NorthStarId, ceilingCal ) );
end;
