%% Motor_setComId
% Associate a Motor object with a communication interface.
% Bind the Motor object to a specific Robotino.
%% Function 
% |[ success ] = Motor_setComId( MotorId, ComId )|
%
% MotorId is the id of the Motor object.
%
% ComId is the communication id.
%% Example Usage 
% |success = Motor_setComId( 0, 0 )|
function [ success ] = Motor_setComId( MotorId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Motor_setComId', MotorId, ComId ) );
end;