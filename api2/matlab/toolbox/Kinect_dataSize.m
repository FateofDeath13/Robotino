%% Kinect_dataSize
% Obtain readings size of readings from Robotino's kinect
% Do not forget to call <Kinect_grab.html Kinect_grab> first
%% Function 
% |[ success, depthDataWidth, depthDataHeight,
% objectDataWidth, objectDataHeight ] = Kinect_dataSize(
% KinectId )|
%
% KinectId is the id of the Kinect object
%% Example Usage 
% |[ success, depthDataWidth, depthDataHeight,
% objectDataWidth, objectDataHeight ] = Kinect_dataSize( 0 )|
%% See also
% <example_matlab_Kinect.html Kinect Example>
function [ success, depthDataWidth, depthDataHeight, objectDataWidth, objectDataHeight ] = Kinect_dataSize( KinectId )
if ( init )    
    depthDataWidth_Buffer = 0;
    depthDataWidth_BufferPtr = libpointer( 'uint32Ptr', depthDataWidth_Buffer);

	depthDataHeight_Buffer = 0;
    depthDataHeight_BufferPtr = libpointer( 'uint32Ptr', depthDataHeight_Buffer);
    
    objectDataWidth_Buffer = 0;
    objectDataWidth_BufferPtr = libpointer( 'uint32Ptr', objectDataWidth_Buffer);

	objectDataHeight_Buffer = 0;
    objectDataHeight_BufferPtr = libpointer( 'uint32Ptr', objectDataHeight_Buffer);
    
    success = calllib( 'rec_robotino_api2','Kinect_dataSize', KinectId, depthDataWidth_BufferPtr, depthDataHeight_BufferPtr, objectDataWidth_BufferPtr, objectDataHeight_BufferPtr);
    depthDataWidth = uint32( get( depthDataWidth_BufferPtr, 'Value' ) );
    depthDataHeight = uint32( get( depthDataHeight_BufferPtr, 'Value' ) );
    objectDataWidth = uint32( get( objectDataWidth_BufferPtr, 'Value' ) );
    objectDataHeight = uint32( get( objectDataHeight_BufferPtr, 'Value' ) );
end;