%% Motor_setSetPointSpeed
% Sets the setpoint speed of a motor.
%% Function 
% |[ success ] = Motor_setSetPointSpeed( MotorId, Speed )|
%
% MotorId is the id of the Motor object.
%
% Speed is the speed set-point in rpm.
%% Example Usage 
% |success = Motor_setSetPointSpeed( 0, 100 )|
function [ success ] = Motor_setSetPointSpeed( MotorId, Speed )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Motor_setSetPointSpeed', MotorId, Speed ) );
end;