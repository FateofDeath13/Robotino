%% LaserRangeFinder_grab
% Grab readings from laser rangefinder
%% Function 
% |[ new_readings_available ] = LaserRangeFinder_grab( LaserRangeFinderId
% )|
%
% Returns true (1) if new readings are available since the last call of
% LaserRangeFinder_grab. Returns false (0) otherwise
%
% LaserRangeFinderId is the id of the LaserRangeFinder object
%% Example Usage
% |[ new_readings_available ] = LaserRangeFinder_grab( 0 )|
%% See also
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
function [ new_readings_available ] = LaserRangeFinder_grab( LaserRangeFinderId )
if ( init )
    new_readings_available = logical( calllib( 'rec_robotino_api2','LaserRangeFinder_grab', LaserRangeFinderId ) );
end;