%% LaserRangeFinder_setComId
% Associate a LaserRangeFinder object with a communication interface
% Bind the LaserRangeFinder object to a specific Robotino.
%% Function
% |[success ] = LaserRangeFinder_setComId( LaserRangeFinderId, ComId )|
%
% LaserRangeFinderId is the id of the LaserRangeFinder object
%
% ComId is the communication id.
%% Example Usage 
% |success = LaserRangeFinder_setComId( 0, 0 )|
%% See also
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
function [ success ] = LaserRangeFinder_setComId( LaserRangeFinderId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','LaserRangeFinder_setComId', LaserRangeFinderId, ComId ) );
end;