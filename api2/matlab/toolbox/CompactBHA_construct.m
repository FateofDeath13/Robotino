%% CompactBHA_construct
% Construct the CompactCBHA object
%% Function 
% |[ CompactBHAId ] = CompactBHA_construct|
%
% Returns the CompactCBHAId of the newly constructed CompactCBHA object
%% Example Usage
% |CompactCBHAId = CompactCBHA_construct|
%% See also
% <example_matlab_CompactBHA.html CompactBHA Example>
function [ CompactBHAId ] = CompactBHA_construct
if ( init )
    CompactBHAId =  calllib( 'rec_robotino_api2','CompactBHA_construct' );  
end;