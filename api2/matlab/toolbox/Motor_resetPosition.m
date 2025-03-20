%% Motor_resetPosition
% Resets the position of a motor.
%% Function 
% |[ success ] = Motor_resetPosition( MotorId )|
%
% MotorId is the id of the Motor object.
%% Example Usage 
% |success = Motor_resetPosition( 0 )|
function [ success ] = Motor_resetPosition( MotorId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Motor_resetPosition', MotorId ) );
end;