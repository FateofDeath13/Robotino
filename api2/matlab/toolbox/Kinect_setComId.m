%% Kinect_setComId
% Associate a Kinect object with a communication interface
% Bind the Kinect object to a specific Robotino.
%% Function
% |[success ] = Kinect_setComId( KinectId, ComId )|
%
% KinectId is the id of the Kinect object
%
% ComId is the communication id.
%% Example Usage 
% |success = Kinect_setComId( 0, 0 )|
%% See also
% <example_matlab_Kinect.html Kinect Example>
function [ success ] = Kinect_setComId( KinectId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Kinect_setComId', KinectId, ComId ) );
end;