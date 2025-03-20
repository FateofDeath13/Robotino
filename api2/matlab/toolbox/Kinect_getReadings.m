%% Kinect_getReadings
% Obtain readings from Robotino's laser rangefinder
% Do not forget to call <Kinect_grab.html Kinect_grab> first
%% Function 
% |[ success, depth_data, object_data,
%  depthDataHeight, objectDataWidth, objectDataHeight,
% format, stamp ] = Kinect_getReadings(
% KinectId )|
%
% KinectId is the id of the Kinect object
%% Example Usage 
% |[ success, depth_data, object_data,
% depthDataHeight, objectDataWidth, objectDataHeight,
% format, stamp ] = Kinect_getReadings( 0 )|
%% See also
% <example_matlab_Kinect.html Kinect Example>
function [ success, depth_data, object_data, depthDataWidth, depthDataHeight, objectDataWidth, objectDataHeight, format, stamp ] = Kinect_getReadings( KinectId )
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

	depth_data_Buffer = zeros(depthDataWidth*depthDataHeight,1);
    depth_data_BufferPtr = libpointer( 'singlePtr', depth_data_Buffer);

	object_data_Buffer = zeros(objectDataWidth*objectDataHeight,1);
    object_data_BufferPtr = libpointer( 'singlePtr', object_data_Buffer);

	format_Buffer = 0;
    format_BufferPtr = libpointer( 'uint32Ptr', format_Buffer);

	stamp_Buffer = 0;
    stamp_BufferPtr = libpointer( 'uint32Ptr', stamp_Buffer);
    
    success = calllib( 'rec_robotino_api2','Kinect_getReadings', KinectId, depth_data_BufferPtr, object_data_BufferPtr, depthDataWidth_BufferPtr, depthDataHeight_BufferPtr, objectDataWidth_BufferPtr, objectDataHeight_BufferPtr, format_BufferPtr, stamp_BufferPtr);
    
    depth_data_flat = single( get( depth_data_BufferPtr, 'Value' ) );
    depth_data=zeros(depthDataHeight,depthDataWidth);
    for y=1:depthDataHeight
        for x=1:depthDataWidth
            depth_data(y,x)=depth_data_flat(x+(y-1)*depthDataWidth);
        end;
    end;
    
    object_data_flat = single( get( object_data_BufferPtr, 'Value' ) );
    object_data=zeros(objectDataHeight,objectDataWidth);
    for y=1:objectDataHeight
        for x=1:objectDataWidth
            object_data(y,x)=object_data_flat(x+(y-1)*objectDataWidth);
        end;
    end;
    
	depthDataWidth = uint32( get( depthDataWidth_BufferPtr, 'Value' ) );
    depthDataHeight = uint32( get( depthDataHeight_BufferPtr, 'Value' ) );
    objectDataWidth = uint32( get( objectDataWidth_BufferPtr, 'Value' ) );
    objectDataHeight = uint32( get( objectDataHeight_BufferPtr, 'Value' ) );
    format = uint32( get( format_BufferPtr, 'Value' ) );
    stamp = uint32( get( stamp_BufferPtr, 'Value' ) );
end;