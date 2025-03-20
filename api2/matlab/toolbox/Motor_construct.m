%% Motor_construct
% Constructs a Motor object of a motor number n

%% Function
% |[ MotorId ] = Motor_construct( n )|
%
% Returns a MotorId which is the id of the newly constructed Motor object.
%
% n is the number of the motor.
%% Example Usage 
% |MotorId = Motor_construct( 0 )|
function [ MotorId ] = Motor_construct( n )
if ( init )
    MotorId =  calllib( 'rec_robotino_api2','Motor_construct', n );  
end;