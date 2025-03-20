%% CompactBHA_setCompressorsEnabled
%% Function 
% |[ success ] = CompactBHA_setCompressorsEnabled( CompactBHAId, enabled )|
%
% Enables and disables the compressors of the CompactBHA device.
%
% CompactBHAId is the id of the CompactBHA device.
%
% enabled is the state of the compressors.
%
%% Example Usage 
% |success = CompactBHA_setCompressorsEnabled( 0, 1 )|
%% See also
% <example_matlab_CompactBHA.html CompactBHA Example>
function [ success ] = CompactBHA_setCompressorsEnabled( CompactBHAId, enabled )
if ( init )
    success = calllib( 'rec_robotino_api2','CompactBHA_setCompressorsEnabled', CompactBHAId, enabled );
end;