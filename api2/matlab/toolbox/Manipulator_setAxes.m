%% Manipulator_setAxes
% Set position and speed of Axes
%% Function 
% |[ success ] = Manipulator_setAxes( ManipulatorId, angles, numAngles,
% speeds, numSpeeds )|
%
% ManipulatorId is the id of the Manipulator object
%
% angles is an array containing the set-points in degrees
%
% numAngles is the number of elements in angles
%
% speeds is an array containing the speed set-points in rpm
%
% numSpeeds is the number of elements in speeds
%
%% Example Usage 
% |success = Manipulator_setAxes( 0, [100, 100, 100, 100, 100, 100,
% 100, 100, 100], 9, [10, 10, 10, 10, 10, 10, 10, 10, 10], 9 )|
%% See also
% <example_matlab_Manipulator.html Manipulator Example>
function [ success ] = Manipulator_setAxes( ManipulatorId, angles, numAngles, speeds, numSpeeds )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Manipulator_setAxes', ManipulatorId, angles, numAngles, speeds, numSpeeds ) );
end;