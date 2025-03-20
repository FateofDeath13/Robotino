%% Info_construct
% Constructs an Info object
%% Function 
% |[ InfoId ] = Info_construct|
%
% InfoId is the id of the newly constructed Info object
%% Example Usage 
% |InfoId = Info_construct|
function [ InfoId ] = Info_construct
if ( init )
    InfoId =  calllib( 'rec_robotino_api2','Info_construct');  
end;