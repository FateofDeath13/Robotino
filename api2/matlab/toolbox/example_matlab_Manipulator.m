%% Manipulator Example
% In this example Robotino's manipulator is raised up and down by at every
% two second intervals.
%%
%%
% 
% <<../images/manipulator_example.png>>
%

%% Description
% Robotino can be equipped with a manipulator (arm) and this example
% explains how the manipulator can be controlled.

%% Code explanation
% First we will need to construct objects that we will be requiring in our
% program. In this program, we will require objects of |Com| and
% |Manipulator|. This is done as follows.

ComId = Com_construct;
ManipulatorId = Manipulator_construct;

%%
% Upon successful contruction of the objects, an Id is returned for each
% object. This Id is used later when communicating with Robotino. Now we
% need to set the address of Robotino and then connect to it. This is done
% as follows.
%%
% *Note the IP address and port number might be different*
Com_setAddress(ComId, '127.0.0.1');
Com_connect(ComId);

%%
% 
% Once we are connected to Robotino, we need to bind the Manipulator object we
% created to Robotino using the ComId. This can be done as follows.
%
Manipulator_setComId(ManipulatorId, ComId);

% Array which contains the set-points in degrees to raise the manipulator
anglesUP = [150, 150, 150, 150, 150, 150, 150, 150, 150];
% Array which contains the set-points in degrees to lower the manipulator
anglesDOWN = [100, 100, 100, 100, 100, 100, 100, 100, 100];
% Array which contains the speed set-points in rpm
speeds = [10, 10, 10, 10, 10, 10, 10, 10, 10];

%%
% 
% We then start our "stop watch" to limit the example execution to 60
% seconds.
% 
tStart = tic;

%%
% 
% We initiate a while loop and let it run for 60 seconds and at every two
% second intervals, we set different angle values to raise or lower
% Robotino's manipulator.

tElapsed = toc(tStart);
while (tElapsed < 60)
    % Make the manipulator rise up
    Manipulator_setAxes(ManipulatorId, anglesUP, 9, speeds, 9);
    pause(2);
    % Lower the manipulator down
    Manipulator_setAxes(ManipulatorId, anglesDOWN, 9, speeds, 9);
    pause(2);
    tElapsed = toc(tStart);
end;

%%
% 
% Once 60 seconds have been elapsed and the while loop is exited. We will
% need to disconnect from Robotino as follows.
% 
Com_disconnect(ComId);

%%
% 
% It is also recommended to destroy all objects that we created for our
% example. This can be done as follows.
%
Manipulator_destroy(ManipulatorId);
Com_destroy(ComId);