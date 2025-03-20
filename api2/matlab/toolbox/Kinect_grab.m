%% Kinect_grab
% Grab readings from laser rangefinder
%% Function 
% |[ new_readings_available ] = Kinect_grab( KinectId
% )|
%
% Returns true (1) if new readings are available since the last call of
% Kinect_grab. Returns false (0) otherwise
%
% KinectId is the id of the Kinect object
%% Example Usage
% |[ new_readings_available ] = Kinect_grab( 0 )|
%% See also
% <example_matlab_Kinect.html Kinect Example>
function [ new_readings_available ] = Kinect_grab( KinectId )
if ( init )
    new_readings_available = logical( calllib( 'rec_robotino_api2','Kinect_grab', KinectId ) );
end;