%% Manipulator_setComId
% Associate a Manipulator object with a communication interface
% Bind the Manipulator object to a specific Robotino.
%% Function 
% |[ success ] = Manipulator_setComId( ManipulatorId, ComId )|
%
% ManipulatorId is the id of the Manipulator object.
%
% ComId is the communication id.
%% Example Usage 
% |success = Manipulator_setComId( 0, 0 )|
%% See also
% <example_matlab_Manipulator.html Manipulator Example>
function [ success ] = Manipulator_setComId( ManipulatorId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Manipulator_setComId', ManipulatorId, ComId ) );
end;