%% OmniDrive_construct
% Constructs an OmniDrive object.
%% Function 
% |[ OmniDriveId ] = OmniDrive_construct|
%
% Returns an OmniDriveId which is the id of the newly constructed OmniDrive
% object.
%% Example Usage 
% |OmniDriveId = OmniDrive_construct|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ OmniDriveId ] = OmniDrive_construct
if ( init )
    OmniDriveId =  calllib( 'rec_robotino_api2','OmniDrive_construct' );
end;