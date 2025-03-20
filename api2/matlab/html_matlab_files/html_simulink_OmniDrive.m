%% OmniDrive
%
% <<../images/simulink_omnidrive.png>>
%
% Using the matlab functions provided, Robotino's omnidirectional
% capability can be exploited.
%% Block properties
%
% *Inputs*
%
% # ComId
% # vx, target - the velocity in the x direction in mm/s.
% # vy, target - the velocity in the y direction in mm/s.
% # w, target - the angular velocity in deg/s.
%
% *Outputs*
%
% # v1 - the resulting speed of motor 0 in rpm.
% # v2 - the resulting speed of motor 1 in rpm.
% # v3 - the resulting speed of motor 2 in rpm.
%% Examples
%
% <html_simulink_example_DistanceSensor.html DistanceSensor Example>
%
% <html_simulink_example_LaserRangeFinder.html LaserRangeFinder Example>
%
% <html_simulink_example_LineFollowerAnalogInput.html AnalogInput Example>
%
% <html_simulink_example_LineFollowerCamera.html Camera Example>
%
% <html_simulink_example_LineFollowerDigitalInput.html DigitalInput
% Example>
%
% <html_simulink_example_RobotinoHardware.html RobotinoHardware Example>