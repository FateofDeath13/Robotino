%% PowerOutput_setValue
% Sets the current set point of the power output.
%% Function
% |[ success ] = PowerOutput_setValue( PowerOutputId, setPoint )|
%
% PowerOutputId is the id of the PowerOutput object.
%
% setPoint is the set point. Range from -100 to 100.
%% Example Usage
% |success = PowerOutput_setValue( 0, 50 )|
function [ success ] = PowerOutput_setValue( PowerOutputId, setPoint )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','PowerOutput_setValue', PowerOutputId, setPoint ) );
end;