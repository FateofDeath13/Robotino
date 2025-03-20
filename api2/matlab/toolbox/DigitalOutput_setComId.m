%% DigitalOutput_setComId
% Associate a DigitalOutput object with a communication interface
% Bind the DigitalOutput object to a specific Robotino.
%% Function 
% |[ success ] = DigitalOutput_setComId( DigitalOutputId, ComId )|
%
% DigitalOutputId is the id of the DigitalOutput object
%
% ComId is the communication id
%% Example Usage
% |success = DigitalOutput_setComId( 0, 0 )|
function [ success ] = DigitalOutput_setComId( DigitalOutputId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','DigitalOutput_setComId', DigitalOutputId, ComId ) );
end;