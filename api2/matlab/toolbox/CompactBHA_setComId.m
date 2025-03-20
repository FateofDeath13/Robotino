%% CompactBHA_setComId
% Associate an CompactBHA object with a communication interface
% Bind the CompactBHA to a specific Robotino.
%% Function 
% |[ success ] = CompactBHA_setComId( CompactBHAId, ComId )|
%
% CompactBHAId is the id of the CompactBHA object.
%
% ComId is the communication id.
%
%% Example Usage 
% |success = CompactBHA_setComId( 0, 0 )|
%% See also
% <example_matlab_CompactBHA.html CompactBHA Example>
function [ success ] = CompactBHA_setComId( CompactBHAId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','CompactBHA_setComId', CompactBHAId, ComId ) );
end;