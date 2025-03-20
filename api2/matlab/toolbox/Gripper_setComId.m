%% Gripper_setComId
% Associate a Gripper object with a communication interface.
% Bind the Gripper object to a specific Robotino.
%% Function
% |[ success ] = Gripper_setComId( GripperId, ComId )|
%
% GripperId is the id of the Gripper object
%
% ComId is the communication id.
%% Example Usage 
% |success = Gripper_setComId( 0, 0 )|
function [ success ] = Gripper_setComId( GripperId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Gripper_setComId', GripperId, ComId ) );
end;