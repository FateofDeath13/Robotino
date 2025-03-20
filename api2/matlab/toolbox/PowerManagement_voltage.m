%% PowerManagement_voltage
%% Function
% |[ voltage ] = PowerManagement_voltage( PowerManagementId )|
%
% Returns the battery voltage.
%
% PowerManagementId is the id of the PowerManagement object.
%% Example Usage
% |voltage = PowerManagement_voltage( 0 )|
function [ voltage ] = PowerManagement_voltage( PowerManagementId )
if ( init )
    voltage = calllib( 'rec_robotino_api2','PowerManagement_voltage', PowerManagementId );
end;