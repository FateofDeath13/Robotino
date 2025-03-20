%% CompactBHA_setGripperValve2
%% Function 
% |[ success ] = CompactBHA_setGripperValve2( CompactBHAId, open )|
%
% Opens and closes the gripper valve 2 of the CompactBHA device.
%
% CompactBHAId is the id of the CompactBHA device.
%
% open is the state of the valve.
%
%% Example Usage 
% |success = CompactBHA_setGripperValve2( 0, 1 )|
%% See also
% <example_matlab_CompactBHA.html CompactBHA Example>
function [ success ] = CompactBHA_setGripperValve2( CompactBHAId, open )
if ( init )
    success = calllib( 'rec_robotino_api2','CompactBHA_setGripperValve2', CompactBHAId, open );
end;