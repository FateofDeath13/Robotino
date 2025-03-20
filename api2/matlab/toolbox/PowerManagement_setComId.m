%% PowerManagement_setComId
% Associate a PowerManagement object with a communication interface.
% Bind the PowerManagement object to a specific Robotino.
%% Function 
% |[ success ] = PowerManagement_setComId( PowerManagementId, ComId )|
%
% PowerManagementId is the id of the PowerManagement object.
%
% ComId is the communication id.
%% Example Usage 
% |success = PowerManagement_setComId( 0, 0 )|
function [ success ] = PowerManagement_setComId( PowerManagementId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','PowerManagement_setComId', PowerManagementId, ComId ) );
end;