%% Kinect_destroy
% Destroys the Kinect object assigned to KinectId
%% Function 
% |[ success ] = Kinect_destroy( KinectId )|
%
% KinectId is the id of the Kinect object to be
% destroyed.
%% Example Usage
% |success = Kinect_destroy( 0 )|
%% See also
% <example_matlab_Kinect.html Kinect Example>
function [ success ] = Kinect_destroy( KinectId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Kinect_destroy', KinectId ) );
end;