%% LaserRangeFinder_destroy
% Destroys the LaserRangeFinder object assigned to LaserRangeFinderId
%% Function 
% |[ success ] = LaserRangeFinder_destroy( LaserRangeFinderId )|
%
% LaserRangeFinderId is the id of the LaserRangeFinder object to be
% destroyed.
%% Example Usage
% |success = LaserRangeFinder_destroy( 0 )|
%% See also
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
function [ success ] = LaserRangeFinder_destroy( LaserRangeFinderId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','LaserRangeFinder_destroy', LaserRangeFinderId ) );
end;