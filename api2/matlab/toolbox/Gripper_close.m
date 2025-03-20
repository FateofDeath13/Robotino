%% Gripper_close
% Closes the gripper
%% Function 
% |[ success ] = Gripper_close( GripperId )|
%
% GripperId is the id of the Gripper object
%% Example Usage 
% |success = Gripper_close( 0 )|
function [ success ] = Gripper_close( GripperId )
if ( init )
    success =  logical( calllib( 'rec_robotino_api2','Gripper_close', GripperId ) );  
end;