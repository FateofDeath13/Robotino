%% Kinect_construct
% Constructs a Kinect object
%% Function 
% |[ KinectId ] = Kinect_construct|
%
% KinectId is the id of the newly constructed Kinect
% object
%% Example Usage 
% |KinectId = Kinect_construct|
%% See also
% <example_matlab_Kinect.html Kinect Example>
function [ KinectId ] = Kinect_construct
if ( init )
    KinectId =  calllib( 'rec_robotino_api2','Kinect_construct' );  
end;