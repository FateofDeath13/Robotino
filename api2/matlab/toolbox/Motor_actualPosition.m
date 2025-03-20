%% Motor_actualPosition
% Retrieves the actual position of a motor
%% Function
% |[ position ] = Motor_actualPosition( MotorId )|
%
% MotorId is the id of the Motor object
%% Example Usage 
% |position = Motor_actualPosition( 0 )|
function [ position ] = Motor_actualPosition( MotorId )
if ( init )
    position = calllib( 'rec_robotino_api2','Motor_actualPosition', MotorId );
end;