%% CompactBHA_foilPot
%% Function 
% |[ value ] = CompactBHA_foilPot( CompactBHAId )|
%
% Returns the current value of the foil pot of the CompactBHA device.
%
% CompactBHAId is the id of the CompactBHA device.
%
%% Example Usage 
% |value = CompactBHA_foilPot( 0 )|
%% See also
% <example_matlab_LineFollowerCompactBHA.html CompactBHA Example>
function [ value ] = CompactBHA_foilPot( CompactBHAId )
if ( init )
    value = calllib( 'rec_robotino_api2','CompactBHA_foilPot', CompactBHAId );
end;