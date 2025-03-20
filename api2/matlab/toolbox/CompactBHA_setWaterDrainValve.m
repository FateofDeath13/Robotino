%% CompactBHA_setWaterDrainValve
%% Function 
% |[ success ] = CompactBHA_setWaterDrainValve( CompactBHAId, open )|
%
% Opens and closes the water drain valve of the CompactBHA device.
%
% CompactBHAId is the id of the CompactBHA device.
%
% open is the state of the valve.
%
%% Example Usage 
% |success = CompactBHA_setWaterDrainValve( 0, 1 )|
%% See also
% <example_matlab_CompactBHA.html CompactBHA Example>
function [ success ] = CompactBHA_setWaterDrainValve( CompactBHAId, open )
if ( init )
    success = calllib( 'rec_robotino_api2','CompactBHA_setWaterDrainValve', CompactBHAId, open );
end;