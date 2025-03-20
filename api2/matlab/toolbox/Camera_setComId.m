%% Camera_setComId
% Associate a Camera object with a communication interface
% Bind the Camera to a specific Robotino. 
%% Function 
% |[ success ] = Camera_setComId( CameraId, ComId ) |
%
% CameraId is the id of the Camera object
%
% ComId is the communication id.
%% Example Usage
% |success = Camera_setComId( 0, 0 )|
%% See also
% <example_matlab_LineFollowerCamera.html Camera Example>
function [ success ] = Camera_setComId( CameraId, ComId ) 
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Camera_setComId', CameraId, ComId ) );
end;