%% Manipulator_grab
% Grab readings from Robotino's manipulator
%% Function 
% |[ new_readings_available ] = Manipulator_grab( ManipulatorId )|
%
% Returns true (1) if new readings are available since the last call of
% Manipulator_grab. Returns false (0) otherwise.
%
% ManipulatorId is the id of the Manipulator object.
%% Example Usage 
% |[ new_readings_available ] = Manipulator_grab( 0 )|
%% See also
% <example_matlab_Manipulator.html Manipulator Example>
function [ new_readings_available ] = Manipulator_grab( ManipulatorId )
if ( init )
    new_readings_available = logical( calllib( 'rec_robotino_api2','Manipulator_grab', ManipulatorId ) );
end;