%% CompactBHA_stringPots
%% Function 
% |[ success, readings ] = CompactBHA_stringPots( CompactBHAId )|
%
% Returns the current values of the string pots of the CompactBHA device.
%
% CompactBHAId is the id of the CompactBHA device.
%
%% Example Usage 
% |[ success, readings ] = CompactBHA_stringPots( 0 )|
%% See also
% <example_matlab_CompactBHA.html CompactBHA Example>
function [ success, readings ] = CompactBHA_stringPots( CompactBHAId )
if ( init )
	readings_Buffer = zeros(6,1);
	readings_BufferPtr = libpointer( 'singlePtr', readings_Buffer);
    success = calllib( 'rec_robotino_api2','CompactBHA_stringPots', CompactBHAId, readings_BufferPtr );
    readings = single( get( readings_BufferPtr, 'Value' ) );
end;