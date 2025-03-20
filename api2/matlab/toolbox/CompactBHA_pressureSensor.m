%% CompactBHA_pressureSensor
%% Function 
% |[ value ] = CompactBHA_pressureSensor( CompactBHAId )|
%
% Returns the signal from the pressure sensor of the CompactBHA device.
%
% CompactBHAId is the id of the CompactBHA device.
%
%% Example Usage 
% |value = CompactBHA_pressureSensor( 0 )|
%% See also
% <example_matlab_CompactBHA.html CompactBHA Example>
function [ value ] = CompactBHA_pressureSensor( CompactBHAId )
if ( init )
    value = calllib( 'rec_robotino_api2','CompactBHA_pressureSensor', CompactBHAId );
end;