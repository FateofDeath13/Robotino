%% NorthStar_construct
% Constructs a NorthStar object.
%% Function 
% |[ NorthStarId ] = NorthStar_construct|
%
% Returns a NorthStarId which is the id of the newly constructed NorthStar
% object.
%% Example Usage 
% |NorthStarId = NorthStar_construct|
function [ NorthStarId ] = NorthStar_construct
if ( init )
    NorthStarId =  calllib( 'rec_robotino_api2','NorthStar_construct');  
end;
