%% DigitalInput
%
% <<../images/simulink_digitalinput.png>>
%
% There are 8 Digital Inputs available on Robotino (see figure below: DI1 - DI8). 
% The digital inputs can be connected to various devices/detectors and values 
% can be read from them. For instance, Robotino could be equipped with optical 
% sensors connected to its digital inputs.

%%
% 
% <<../images/robotino_io_connector.png>>
%
%% Block properties
%
% *Inputs*
%
% # ComId
%
% *Outputs*
%
% # Value - the value (either 0 or 1) at the specified DigitalInput number.
%
% *Parameters*
%
% # DigitalInput number - Range is 0 - 7
%% Examples
%
% <html_simulink_example_LineFollowerDigitalInput.html DigitalInput Example>
%
% <html_simulink_example_RobotinoHardware.html RobotinoHardware Example>