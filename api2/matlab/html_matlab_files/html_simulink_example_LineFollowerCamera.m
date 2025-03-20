%% Camera Example
% This example illustrates the use of the Camera on Robotino.
% Robotino is equipped with a color camera with VGA resolution and using
% this Camera, we can make Robotino detect a black line on the floor.
%%
% 
% <<../images/linefollow_example.png>>
%
%% Blocks used in this example
%
% <html_simulink_Bumper.html Bumper>
%
% <html_simulink_Camera.html Camera>
%
% <html_simulink_Com.html Com>
%
% <html_simulink_LineFollower.html LineFollower>
%
% <html_simulink_Motor.html Motor>
%
% <html_simulink_OmniDrive.html OmniDrive>
%% Description
% Using the color camera on Robotino, we can obtain images from Robotino.
% After obtaining the images (in R, G, B values), they are sent to the
% <html_simulink_LineFollower.html Line Follower block> which inturn
% caculates the target x-velocity, y-velocity and omega values for
% Robotino. These are then used as inputs for the
% <html_simulink_OmniDrive.html OmniDrive block>. The motor speeds returned
% from the <html_simulink_OmniDrive.html OmniDrive block> are then set for
% the three <html_simulink_Motor.html Motor> blocks.
%
% <<../images/simulink_example_camera.png>>
%