%% Com_destroy
% Destroy the communication interface assigned to ComId

%% Function 
% |[ success ] = Com_destroy( ComId )|
%
% ComId is the id of the Com object to be destroyed
%% Example Usage
% |success = Com_destroy( 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
% <example_matlab_Manipulator.html Manipulator Example>
function [ success ] = Com_destroy( ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Com_destroy', ComId ) );
end;