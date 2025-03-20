%% Gripper_isOpened
%% Function 
% |[ isOpened ] = Gripper_isOpened( GripperId )|
%
% Returns true (1) if the gripper is opened, false (0) otherwise
%
% GripperId is the id of the Gripper object
%% Example Usage
% |isOpened = Gripper_isOpened( 0 )|
function [ isOpened ] = Gripper_isOpened( GripperId )
if ( init )
    isOpened =  calllib( 'rec_robotino_api2','Gripper_isOpened', GripperId );  
end;