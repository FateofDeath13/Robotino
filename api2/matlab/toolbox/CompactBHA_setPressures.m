%% CompactBHA_setPressures
%% Function 
% |[ success ] = CompactBHA_setPressures( CompactBHAId, pressures )|
%
% Sets the pressures of all bellows of the CompactBHA device.
%
% CompactBHAId is the id of the CompactBHA device.
%
% pressures is an array of size 8 containing the pressure values.
%
%% Example Usage 
% |success = CompactBHA_setPressures( 1, [1, 1, 0.5, 0.5, 1, 1, 0.5, 0.5] )|
%% See also
% <example_matlab_CompactBHA.html CompactBHA Example>
function [ success ] = CompactBHA_setPressures( CompactBHAId, pressures )
if ( init )
    success = calllib( 'rec_robotino_api2','CompactBHA_setPressures', CompactBHAId, pressures );
end;