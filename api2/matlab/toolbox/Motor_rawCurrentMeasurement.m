%% Motor_rawCurrentMeasurement
% The current is measured by a 10 bit adc and is not converted into A.
%% Function 
% |[ current ] = Motor_rawCurrentMeasurment( MotorId )|
%
% Retrieves the current delivered to a motor.
%
% MotorId is the id of the Motor object.
%% Example Usage
% |current = Motor_rawCurrentMeasurment( 0 )|
%% See also
% <example_matlab_DistanceSensor.html DistanceSensor Example>
% <example_matlab_LaserRangeFinder.html LaserRangeFinder Example>
% <example_matlab_LineFollowerCamera.html Camera Example>
% <example_matlab_LineFollowerAnalogInput.html AnalogInput Example>
% <example_matlab_LineFollowerDigitalInput.html DigitalInput Example>
function [ current ] = Motor_rawCurrentMeasurment( MotorId )
if ( init )
    current = calllib( 'rec_robotino_api2','Motor_rawCurrentMeasurment', MotorId );
end;