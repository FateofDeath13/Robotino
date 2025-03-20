%% CompactBHA_pressures
%% Function 
% |[ success, readings ] = CompactBHA_pressures( CompactBHAId )|
%
% Returns the pressures of all bellows of the CompactBHA device.
%
% CompactBHAId is the id of the CompactBHA device.
%
%% Example Usage 
% |[ success, readings ] = CompactBHA_pressures( 0 )|
%% See also
% <example_matlab_CompactBHA.html CompactBHA Example>
function [ success, readings ] = CompactBHA_pressures( CompactBHAId )
if ( init )
	readings_Buffer = zeros(8,1);
	readings_BufferPtr = libpointer( 'singlePtr', readings_Buffer);
    success = calllib( 'rec_robotino_api2','CompactBHA_pressures', CompactBHAId, readings_BufferPtr );
    readings = single( get( readings_BufferPtr, 'Value' ) );
end;