function blkStruct = slblocks  
 
%SLBLOCKS Defines a block library.  
 
% Library's name. The name appears in the Library Browser's  
% contents pane.  
 
blkStruct.Name = ['Robotino Hardware' sprintf('\n') 'Library for MATLAB/Simulink'];  
 
% The function that will be called when the user double-clicks on
% the library's name. ;  
 
blkStruct.OpenFcn = 'robotino';  

%
% The argument to be set as the Mask Display for the subsystem.  You
% may comment this line out if no specific mask is desired.
% Example:  blkStruct.MaskDisplay = 'plot([0:2*pi],sin([0:2*pi]));';
% No display for Simulink Extras.
%
blkStruct.MaskDisplay = '';

%
% Define the Browser structure array, the first element contains the
% information for the Simulink block library and the second for the
% Simulink Extras block library.
%
Browser(1).Library = 'simulink';
Browser(1).Name    = 'Simulink';
Browser(1).IsFlat  = 0; % Is this library "flat" (i.e. no subsystems)?

Browser(2).Library = 'robotino';
%Browser(2).Name    = 'matrob';
Browser(2).Name    = 'Robotino';
Browser(2).IsFlat  = 0; % Is this library "flat" (i.e. no subsystems)?

blkStruct.Browser = Browser;
clear Browser;

%
% Define information about Signal Viewers
%
Viewer(1).Library = 'simviewers';
Viewer(1).Name    = 'Simulink';

blkStruct.Viewer = Viewer;
clear Viewer;

%
% Define information about Signal Generators
%
Generator(1).Library = 'simgens';
Generator(1).Name    = 'Simulink';

blkStruct.Generator = Generator;
clear Generator;

% Define information for model updater
%blkStruct.ModelUpdaterMethods.fhDetermineBrokenLinks = @UpdateSimulinkBrokenLinksMappingHelper;
blkStruct.ModelUpdaterMethods.fhUpdateModel = @UpdateSimulinkBlocksHelper;

% End of slblocks
