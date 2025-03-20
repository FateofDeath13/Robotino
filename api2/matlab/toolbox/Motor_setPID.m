%% Motor_setPID
% Sets the proportional, integral and differential constant of the PID
% controller.
%% Function 
% |[ success ] = Motor_setPID( MotorId, Kp, Ki, Kd )|
%
% MotorId is the id of the Motor object.
%
% Kp is the Proportional Constant.
% Robotino v2: Typical value 200. Maximum value is 255. Minimum value is 0.
% Robotino v3: Typical value is 0.1. If value less than 0 than the internal
% default is used.
%
% Ki is the Integral Constant.
% Robotino v2: Typical value 10. Maximum value is 255. Minimum value is 0.
% Robotino v3: Typical value is 0.005. If value less than 0 than the internal
% default is used.
%
% Kd is the differential Constant.
% Robotino v2: Typical value 0. Maximum value is 255. Minimum value is 0.
% Robotino v3: Not used, because Robotino v3 implements an PI controller
% only.
%
% Robotino v2: Set Kp=Ki=Kd=255 to use the microcontrollers predefined values.

%% Example Usage 
% |success = Motor_setPID( 0, 200, 10, 0 )|
function [ success ] = Motor_setPID( MotorId, Kp, Ki, Kd )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Motor_setPID', MotorId, Kp, Ki, Kd ) );
end;