%% LaserRangeFinder_getReadings
% Obtain readings from Robotino's laser rangefinder
% Do not forget to call <LaserRangeFinder_grab.html LaserRangeFinder_grab> first
% Make sure that the ranges and intensities arrays are at least 1000 in
% size
%% Function 
% |[ success, seq, stamp, angle_min, angle_max, angle_increment,
% time_increment, scan_time, range_min, range_max, ranges, numRanges,
% intensities, numIntensities ] = LaserRangeFinder_getReadings(
% LaserRangeFinderId )|
%
% LaserRangeFinderId is the id of the LaserRangeFinder object
%% Example Usage 
% |[ success, seq, stamp, angle_min, angle_max, angle_increment,
% time_increment, scan_time, range_min, range_max, ranges, numRanges,
% intensities, numIntensities ] = LaserRangeFinder_getReadings( 0 )|
%% See also
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
function [ success, seq, stamp, angle_min, angle_max, angle_increment, time_increment, scan_time, range_min, range_max, ranges, numRanges, intensities, numIntensities ] = LaserRangeFinder_getReadings( LaserRangeFinderId )
if ( init )
    seq_Buffer = 0;
    seq_BufferPtr = libpointer( 'uint32Ptr', seq_Buffer);
    
    stamp_Buffer = 0;
    stamp_BufferPtr = libpointer( 'uint32Ptr', stamp_Buffer);
    
    angle_min_Buffer = 0.0;
    angle_min_BufferPtr = libpointer( 'singlePtr', angle_min_Buffer);
    
    angle_max_Buffer = 0.0;
    angle_max_BufferPtr = libpointer( 'singlePtr', angle_max_Buffer);
    
    angle_increment_Buffer = 0.0;
    angle_increment_BufferPtr = libpointer( 'singlePtr', angle_increment_Buffer);
    
    time_increment_Buffer = 0.0;
    time_increment_BufferPtr = libpointer( 'singlePtr', time_increment_Buffer);
    
    scan_time_Buffer = 0.0;
    scan_time_BufferPtr = libpointer( 'singlePtr', scan_time_Buffer);
    
    range_min_Buffer = 0.0;
    range_min_BufferPtr = libpointer( 'singlePtr', range_min_Buffer);
    
    range_max_Buffer = 0.0;
    range_max_BufferPtr = libpointer( 'singlePtr', range_max_Buffer);
    
    ranges_Buffer = zeros(1000,1);
    ranges_BufferPtr = libpointer( 'singlePtr', ranges_Buffer);
    
    numRanges_Buffer = 0;
    numRanges_BufferPtr = libpointer( 'uint32Ptr', numRanges_Buffer);
    
    intensities_Buffer = zeros(1000,1);
    intensities_BufferPtr = libpointer( 'singlePtr', intensities_Buffer);
    
    numIntensities_Buffer = 0;
    numIntensities_BufferPtr = libpointer( 'uint32Ptr', numIntensities_Buffer);
    
    success = calllib( 'rec_robotino_api2','LaserRangeFinder_getReadings', LaserRangeFinderId, seq_BufferPtr, stamp_BufferPtr, angle_min_BufferPtr, angle_max_BufferPtr, angle_increment_BufferPtr, time_increment_BufferPtr, scan_time_BufferPtr, range_min_BufferPtr, range_max_BufferPtr, ranges_BufferPtr, numRanges_BufferPtr, intensities_BufferPtr, numIntensities_BufferPtr);
    seq = uint32( get( seq_BufferPtr, 'Value' ) );
    stamp = uint32( get( stamp_BufferPtr, 'Value' ) );
    angle_min = single( get( angle_min_BufferPtr, 'Value' ) );
    angle_max = single( get( angle_max_BufferPtr, 'Value' ) );
    angle_increment = single( get( angle_increment_BufferPtr, 'Value' ) );
    time_increment = single( get( time_increment_BufferPtr, 'Value' ) );
    scan_time = single( get( scan_time_BufferPtr, 'Value' ) );
    range_min = single( get( range_min_BufferPtr, 'Value' ) );
    range_max = single( get( range_max_BufferPtr, 'Value' ) );
    ranges = single( get( ranges_BufferPtr, 'Value' ) );
    numRanges = uint32( get( numRanges_BufferPtr, 'Value' ) );
    intensities = single( get( intensities_BufferPtr, 'Value' ) );
    numIntensities = uint32( get( numIntensities_BufferPtr, 'Value' ) );
end;