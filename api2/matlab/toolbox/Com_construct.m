%% Com_construct
% Construct an interface for communicating to one Robotino

%% Function 
% |[ ComId ] = Com_construct|
%
% Returns the ComId of the newly constructed Com object
%% Example Usage
% |ComId = Com_construct|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
% <example_matlab_Manipulator.html Manipulator Example>
function [ ComId ] = Com_construct
if ( init )
    ComId =  calllib( 'rec_robotino_api2','Com_construct' );
end;