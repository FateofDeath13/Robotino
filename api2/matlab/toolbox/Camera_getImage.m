%% Camera_getImage
% Do not forget to call <Camera_grab.html Camera_grab> first.
%% Function 
% |[ img ] = Camera_getImage( CameraId )|
%
% Returns Robotino's camera image. 
% 
% CameraId is the id of the Camera object
%% Example 
% |img = Camera_getImage( 0 )|
%% See also
% <example_matlab_LineFollowerCamera.html Camera Example>
function [ img ] = Camera_getImage( CameraId )
if ( init )
    imgBuffer = uint8( zeros( 1, 240 * 320 * 3 ) );
    imgBufferPtr = libpointer( 'uint8Ptr', imgBuffer );
    imgBufferSize = length( imgBuffer );
    width = uint32( 0 );
    widthPtr = libpointer( 'uint32Ptr', width );
    height = uint32( 0 );
    heightPtr = libpointer( 'uint32Ptr', height );
    calllib( 'rec_robotino_api2','Camera_getImage', CameraId, imgBufferPtr, imgBufferSize, widthPtr, heightPtr );
    tmp = get( imgBufferPtr, 'Value' );
    width = get( widthPtr, 'Value' )
    height = get( heightPtr, 'Value' )
    % Bildgröße erkennen und resize auf tatsächliche Größe
    % Format ändern rgb|rgb|... -> r...|g...|b...
    img = uint8( zeros( height, width, 3 ) );
    img(:,:,1) = reshape(tmp(1:3:end),width, height)';
    img(:,:,2) = reshape(tmp(2:3:end),width, height)';
    img(:,:,3) = reshape(tmp(3:3:end),width, height)';
end;