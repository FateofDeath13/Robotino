%% Camera_grab
% Grab image from Camera

%% Function 
% |[ image_available ] = Camera_grab( CameraId )|
%
% Returns true (1) if a new image is available since the last call of
% Camera_grab. Returns false (0) otherwise
%
% CameraId is the id of the Camera object
%% Example 
% |image_available = Camera_grab(0)|
%% See also
% <example_matlab_LineFollowerCamera.html Camera Example>
function [ image_available ] = Camera_grab( CameraId )
if ( init )
    image_available = logical( calllib( 'rec_robotino_api2','Camera_grab', CameraId ) );
end;