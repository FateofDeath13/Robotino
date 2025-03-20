%% Gripper_isClosed

%% Function
% |[ isClosed ] = Gripper_isClosed( GripperId )|
%
% Returns true (1) if the gripper is closed, false (0) otherwise
%
% GripperId is the id of the Gripper object
%% Example Usage 
% |isClosed = Gripper_isClosed( 0 )|
function [ isClosed ] = Gripper_isClosed( GripperId )
if ( init )
    isClosed =  calllib( 'rec_robotino_api2','Gripper_isClosed', GripperId );  
end;