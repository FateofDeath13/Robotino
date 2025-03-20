%% OmniDrive_setComId
% Associate an OmniDrive object with a communication interface.
% Bind the OmniDrive object to a specific Robotino.
%% Function 
% |[ success ] = OmniDrive_setComId( OmniDriveId, ComId )|
%
% OmniDriveId is the id of the OmniDrive object.
%
% ComId is the communication id.
%% Example Usage 
% |success = OmniDrive_setComId( 0, 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ success ] = OmniDrive_setComId( OmniDriveId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','OmniDrive_setComId', OmniDriveId, ComId ) );
end;