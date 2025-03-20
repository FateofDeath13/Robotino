%% Motor_motorCurrent
% Retrieves the current (A) of a motor.

%% Function 
% |[ current ] = Motor_motorCurrent( MotorId )|
%
% MotorId is the id of the Motor object.
%% Example Usage 
% |current = Motor_motorCurrent( 0 )|
function [ current ] = Motor_motorCurrent( MotorId )
if ( init )
    current = calllib( 'rec_robotino_api2','Motor_motorCurrent', MotorId );
end;