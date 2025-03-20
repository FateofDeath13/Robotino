%% Kinect_setKinectNumber
% Set the number of the kinect.
%% Function
% |[success ] = Kinect_setKinectNumber( KinectId, number )|
%
% KinectId is the id of the Kinect object
%
% number is the number of the kinect sensor (0 to 3).
%% Example Usage 
% |success = Kinect_setKinectNumber( 0, 0 )|
%% See also
% <example_matlab_Kinect.html Kinect Example>
function [ success ] = Kinect_setKinectNumber( KinectId, number )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Kinect_setKinectNumber', KinectId, number ) );
end;