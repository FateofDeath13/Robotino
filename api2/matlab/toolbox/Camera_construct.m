%% Camera_construct
% Construct a Camera object
%% Function 
% |[ CameraId ] = Camera_construct|
%
% Returns the CameraId of the newly constructed Camera object
%% Example 
% |CameraId = Camera_construct|
%% See also
% <example_matlab_LineFollowerCamera.html Camera Example>
function [ CameraId ] = Camera_construct
if ( init )
    CameraId =  calllib( 'rec_robotino_api2','Camera_construct' );
end;