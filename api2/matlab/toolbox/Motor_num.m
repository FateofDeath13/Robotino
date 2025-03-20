%% Motor_num
%% Function 
% |[ num ] = Motor_num|
%
% Returns the number of drive motors on Robotino.
%% Example Usage 
% |num = Motor_num|
function [ num ] = Motor_num
if ( init )
    num =  calllib( 'rec_robotino_api2','numMotors' );  
end;