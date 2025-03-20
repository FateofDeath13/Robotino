%% Manipulator_setAxis
% Set position and speed of on Axis.
%% Function 
% |[ success ] = Manipulator_setAxis( ManipulatorId, axis, angle, speed )|
%
% ManipulatorId is the id of the Manipulator object.
%
% axis is the Axis number. Axes are counted starting with 0.
%
% angle is the position set-point in degrees
%
% speed is the speed set-point in rpm.
%% Example Usage 
% |success = Manipulator_setAxis( 0, 2, 100, 10 )|
%% See also
% <example_matlab_Manipulator.html Manipulator Example>
function [ success ] = Manipulator_setAxis( ManipulatorId, axis, angle, speed )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Manipulator_setAxis', ManipulatorId, axis, angle, speed ) );
end;