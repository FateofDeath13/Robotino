%% Gripper_open
% Opens the gripper

%% Function 
% |[ success ] = Gripper_open( GripperId )|
%
% GripperId is the id of the Gripper object
%% Example Usage 
% |success = Gripper_open( 0 )|
function [ success ] = Gripper_open( GripperId )
if ( init )
    success =  logical( calllib( 'rec_robotino_api2','Gripper_open', GripperId ) );  
end;