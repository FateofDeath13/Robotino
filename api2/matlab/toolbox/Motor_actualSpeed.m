%% Motor_actualSpeed
% Retrieves the actual speed (rpm) of a motor.
%% Function 
% |[ speed ] = Motor_actualSpeed( MotorId )|
%
% MotorId is the id of the Motor object.
%% Example Usage 
% |speed = Motor_actualSpeed( 0 )|
function [ speed ] = Motor_actualSpeed( MotorId )
if ( init )
    speed = calllib( 'rec_robotino_api2','Motor_actualSpeed', MotorId );
end;