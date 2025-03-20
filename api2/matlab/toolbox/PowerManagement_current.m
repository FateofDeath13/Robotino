%% PowerManagement_current
%% Function 
% |[ current ] = PowerManagement_current( PowerManagementId )|
%
% Returns the current power drain.
%
% PowerManagementId is the id of the PowerManagement object.
%% Example Usage 
% |current = PowerManagement_current( 0 )|
function [ current ] = PowerManagement_current( PowerManagementId )
if ( init )
    current = calllib( 'rec_robotino_api2','PowerManagement_current', PowerManagementId );
end;