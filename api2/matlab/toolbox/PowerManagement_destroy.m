%% PowerManagement_destroy
% Destroys the PowerManagement object assigned to PowerManagementId.
%% Function
% |[ success ] = PowerManagement_destroy( PowerManagementId )|
%
% PowerManagementId is the id of the PowerManagement object to be
% destroyed.
%% Example Usage
% |success = PowerManagement_destroy( 0 )|
function [ success ] = PowerManagement_destroy( PowerManagementId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','PowerManagement_destroy', PowerManagementId ) );
end;