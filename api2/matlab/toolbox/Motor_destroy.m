%% Motor_destroy
% Destroys the Motor object assigned to MotorId.
%% Function 
% |[ success ] = Motor_destroy( MotorId )|
%
% MotorId is the id of the Motor to be destroyed.
%% Example Usage 
% |success = Motor_destroy( 0 )|
function [ success ] = Motor_destroy( MotorId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Motor_destroy', MotorId ) );
end;