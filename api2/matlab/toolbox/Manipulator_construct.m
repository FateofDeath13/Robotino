%% Manipulator_construct
% Constructs a Manipulator object
%% Function 
% |[ ManipulatorId ] = Manipulator_construct|
%
% ManipulatorId is the id of the newly constructed Manipulator object.
%% Example Usage 
% |ManipulatorId = Manipulator_construct|
%% See also
% <example_matlab_Manipulator.html Manipulator Example>
function [ ManipulatorId ] = Manipulator_construct
if ( init )
    ManipulatorId =  calllib( 'rec_robotino_api2','Manipulator_construct' );  
end;