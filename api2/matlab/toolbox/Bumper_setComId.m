%% Bumper_setComId
% Associate a bumper object with a communication interface
% Bind the bumper to a specific Robotino. 
%% Function 
% |[ success ] = Bumper_setComId( BumperId, ComId )|
%
% BumperId is the id of the Bumper object
%
% ComId is the communication id.
%% Example Usage 
% |success = Bumper_setComId( 0, 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ success ] = Bumper_setComId( BumperId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Bumper_setComId', BumperId, ComId ) );
end;