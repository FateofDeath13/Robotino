%% Manipulator_destroy
% Destroys the Manipulator object assigned to ManipulatorId
%% Function 
% |[ success ] = Manipulator_destroy( ManipulatorId )|
%
% ManipulatorId is the id of the Manipulator object to be destroyed
%% Example Usage 
% |success = Manipulator_destroy( 0 )|
%% See also
% <example_matlab_Manipulator.html Manipulator Example>
function [ success ] = Manipulator_destroy( ManipulatorId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Manipulator_destroy', ManipulatorId ) );
end;