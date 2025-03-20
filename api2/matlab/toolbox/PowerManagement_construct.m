%% PowerManagement_construct
% Constructs a PowerManagement object.
%% Function 
% |[ PowerManagementId ] = PowerManagement_construct|
%
% Returns a PowerManagementId which is the id of the newly constructed PowerManagement
% object.
%% Example Usage 
% |PowerManagementId = PowerManagement_construct|
function [ PowerManagementId ] = PowerManagement_construct
if ( init )
    PowerManagementId =  calllib( 'rec_robotino_api2','PowerManagement_construct');  
end;