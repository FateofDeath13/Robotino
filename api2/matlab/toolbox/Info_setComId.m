%% Info_setComId
% Associate an Info object with a communication interface
% Bind the Info object to a specific Robotino.
%% Function 
% |[ success ] = Info_setComId( InfoId, ComId )|
%
% InfoId is the id of the Info object.
%
% ComId is the communication id.
%% Example Usage 
% |success = Info_setComId( 0, 0 )|
function [ success ] = Info_setComId( InfoId, ComId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Info_setComId', InfoId, ComId ) );
end;