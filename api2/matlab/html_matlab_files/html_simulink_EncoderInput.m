%% EncoderInput
%
% <<../images/simulink_encoderinput.png>>
%
% Encoder values such as Position (Actual position of the encoder in ticks
% since power or Reset) and Velocity (Actual velocity in ticks/s) can be
% read.
%% Block properties
%
% *Inputs*
%
% # ComId
% # Reset position - set true (1) to set the current position to zero.
%
% *Outputs*
%
% # Velocity - the actual velocity in ticks/s.
% # Position - Returns the actual position in ticks since power on or since
% 'Reset position' was set to true (1).
