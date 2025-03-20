%% Gripper_construct
% Constructs a Gripper object

%% Function 
% |[ GripperId ] = Gripper_construct|
%
% GripperId is the id of the newly constructed Gripper object
%% Example Usage 
% |GripperId = Gripper_construct|
function [ GripperId ] = Gripper_construct
if ( init )
    GripperId =  calllib( 'rec_robotino_api2','Gripper_construct');  
end;