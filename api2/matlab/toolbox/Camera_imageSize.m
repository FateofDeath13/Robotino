%% Camera_imageSize
%% Function 
% |[ width, height ] = Camera_imageSize( CameraId )|
%
% Returns size of the image acquired by Camera_grab
%
% CameraId is the id of the Camera object
%% Example Usage
% |[width, height] = Camera_imageSize(0)|
%% See also
% <example_matlab_LineFollowerCamera.html Camera Example>
function [ width, height ] = Camera_imageSize( CameraId )
if ( init )
    width = uint32( 0 );
    widthPtr = libpointer( 'uint32Ptr', width );
    height = uint32( 0 );
    heightPtr = libpointer( 'uint32Ptr', height );
    calllib( 'rec_robotino_api2','Camera_imageSize', CameraId, widthPtr, heightPtr );
    width = get( widthPtr, 'Value' );
    height = get( heightPtr, 'Value' );
end;