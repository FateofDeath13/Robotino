%% DigitalOutput_destroy
% Destroy the DigitalOutput object assigned to DigitalOutputId
%% Function 
% |[ success ] = DigitalOutput_destroy( DigitalOutputId )|
%
% DigitalOutputId is the id of the DigitalOutput object
%% Example Usage
% |success = DigitalOutput_destroy( 0 )|
function [ success ] = DigitalOutput_destroy( DigitalOutputId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','DigitalOutput_destroy', DigitalOutputId ) );
end;