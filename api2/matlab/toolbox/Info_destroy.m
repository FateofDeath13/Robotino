%% Info_destroy
% Destroys the Info object assigned to InfoId
%% Function 
% |[ success ] = Info_destroy( InfoId )|
%
% InfoId is the id of the Info object
%% Example Usage 
% |success = Info_destroy( 0 )|
function [ success ] = Info_destroy( InfoId )
if ( init )
    success = logical( calllib( 'rec_robotino_api2','Info_destroy', InfoId ) );
end;