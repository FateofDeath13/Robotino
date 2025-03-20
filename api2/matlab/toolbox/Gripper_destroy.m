%% Gripper_destroy
% Destroys the Gripper object assigned to GripperId
%% Function 
% |[ success ] = Gripper_destroy( GripperId )|
%
% GripperId is the id of the Gripper object
%
%% Example Usage 
% |success = Gripper_destroy( 0 )|
function [ success ] = Gripper_destroy( GripperId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Gripper_destroy', GripperId ) );
end;