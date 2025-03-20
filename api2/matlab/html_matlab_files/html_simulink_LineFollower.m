%% LineFollower
%
% <<../images/simulink_linefollower.png>>
%
% The Line Follower used RGB values as input and calculates the correct
% <html_simulink_OmniDrive.html OmniDrive> velocities to make Robotino follow a line.
%% Block properties
%
% *Inputs*
%
% # ComId
% # R
% # G
% # B
% # Emergency stop - set true (1) to set all the output values to 0.
%
% *Outputs*
%
% # vx, target - velocity in the x-direction in mm/s.
% # vy, target - velocity in the y-direction in mm/s.
% # w, target - angular velocity in degrees/s.
%% Examples
%
% <html_simulink_example_LineFollowerCamera.html Camera Example>
