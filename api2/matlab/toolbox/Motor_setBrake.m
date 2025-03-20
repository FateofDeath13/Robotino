%% Motor_setBrake
% Controls the brake of a motor.
%% Function
% |[ success ] = Motor_setBrake( MotorId, Brake )|
%
% Set Brake to true (1) to activate the brake or false (0) to release the
% brake.
%
% MotorId is the id of the Motor object.
%% Example Usage 
% |success = Motor_setBrake( 0, 1 )|
function [ success ] = Motor_setBrake( MotorId, Brake )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Motor_setBrake', MotorId, logical( Brake ) ) );
end;