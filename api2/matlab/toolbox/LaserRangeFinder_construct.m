%% LaserRangeFinder_construct
% Constructs a LaserRangeFinder object
%% Function 
% |[ LaserRangeFinderId ] = LaserRangeFinder_construct|
%
% LaserRangeFinderId is the id of the newly constructed LaserRangeFinder
% object
%% Example Usage 
% |LaserRangeFinderId = LaserRangeFinder_construct|
%% See also
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
function [ LaserRangeFinderId ] = LaserRangeFinder_construct
if ( init )
    LaserRangeFinderId =  calllib( 'rec_robotino_api2','LaserRangeFinder_construct' );  
end;