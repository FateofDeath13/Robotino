%% CompactBHA_setGripperValve1
%% Function 
% |[ success ] = CompactBHA_setGripperValve1( CompactBHAId, open )|
%
% Opens and closes the gripper valve 1 of the CompactBHA device.
%
% CompactBHAId is the id of the CompactBHA device.
%
% open is the state of the valve.
%
%% Example Usage 
% |success = CompactBHA_setGripperValve1( 0, 1 )|
%% See also
% <example_matlab_CompactBHA.html CompactBHA Example>
function [ success ] = CompactBHA_setGripperValve1( CompactBHAId, open )
if ( init )
    success = calllib( 'rec_robotino_api2','CompactBHA_setGripperValve1', CompactBHAId, open );
end;