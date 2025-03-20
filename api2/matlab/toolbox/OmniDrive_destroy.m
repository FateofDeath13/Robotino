%% OmniDrive_destroy
% Destroys the OmniDrive object assigned to OmniDriveId.
%% Function 
% |[ success ] = OmniDrive_destroy( OmniDriveId )|
%
% OmniDriveId is the id of the OmniDrive object to be destroyed.
%% Example Usage 
% |success = OmniDrive_destroy( 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ success ] = OmniDrive_destroy( OmniDriveId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','OmniDrive_destroy', OmniDriveId ) );
end;