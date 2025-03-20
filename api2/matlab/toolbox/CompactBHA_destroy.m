%% CompactBHA_destroy
% Destroy the CompactBHA object assigned to CompactBHAId
%% Function 
% |[ success ] = CompactBHA_destroy( CompactBHAId )|
%% Example Usage 
% |success = CompactBHA_destroy( 0 )|
%% See also
% <example_matlab_CompactBHA.html CompactBHA Example>
function [ success ] = CompactBHA_destroy( CompactBHAId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','CompactBHA_destroy',CompactBHAId ) );
end;