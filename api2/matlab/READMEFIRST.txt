Using the Robotino MATLAB Drivers
---------------------------------
1. Start MATLAB.

2. The installation sets an environment variable 'ROBOTINOMATLAB_DIR' which points to the 'RobotinoMatlab' dir. 
Change the working directory to 'RobotinoMatlab' by simply entering the following in MATLAB's Command Window

>> cd ( getenv('ROBOTINOMATLAB_DIR'))

3. You will also need to add the 'toolbox' and 'blockset' directories to MATLAB's search path. This can be done 
as follows

>>addpath( strcat( getenv('ROBOTINOMATLAB_DIR'), '/blockset' ) );
>>addpath( strcat( getenv('ROBOTINOMATLAB_DIR'), '/toolbox' ) );

or you could also just run the 'startup.m' file in RobotinoMatlab folder to add the directories to MATLAB's search path.

Robotino MATLAB Help
--------------------

If the steps above have been executed correctly then Robotino's MATLAB help can be accessed from Help>Product Help.

You will notice two help manuals, Robotino Toolbox and Robotino Blockset in the Help Navigator. Robotino Toolbox provides information 
on the MATLAB m-files whereas Robotino Blockset provides information on the Simulink blocks.

Robotino MATLAB Wiki Page
-------------------------

You can also have a look at Robotino MATLAB's wiki page at http://wiki.openrobotino.org/index.php?title=Matlab