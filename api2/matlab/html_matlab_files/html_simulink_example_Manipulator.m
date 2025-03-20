%% Manipulator Example
% In this example Robotino's manipulator is raised up and down by toggling
% a switch.
%%
% 
% <<../images/manipulator_example.png>>
%
%% Blocks used in this example
%
% <html_simulink_Com.html Com>
%
% <html_simulink_Manipulator.html Manipulator>
%% Description
% Robotino can be equipped with a manipulator (arm) and this example
% explains how the manipulator can be controlled.
%
% <<../images/simulink_example_manipulator.png>>
%
% *Case UP*
%
% If the switch is toggled to UP then the following if block is executed
% and each of the angles is set to 150 degrees.
%
% <<../images/simulink_example_manipulator2.png>>
%
% *Case DOWN*
%
% If the switch is toggled to DOWN then the following else block is
% executed and each of the angles is set to 100 degrees.
%
% <<../images/simulink_example_manipulator3.png>>