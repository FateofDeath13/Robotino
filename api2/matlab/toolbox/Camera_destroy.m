%% Camera_destroy
% Destroy the Camera object assigned to a CameraId

%% Function 
% |[ success ] = Camera_destroy( CameraId )|
%
% CameraId is the id of the Camera object to be destroyed

%% Example 
% |success = Camera_destroy( 0 )|
%% See also
% <example_matlab_LineFollowerCamera.html Camera Example>
function [ success ] = Camera_destroy( CameraId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Camera_destroy', CameraId ) );
end;