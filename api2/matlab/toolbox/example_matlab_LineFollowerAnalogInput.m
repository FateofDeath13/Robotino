%% AnalogInput Example
% This example illustrates the use of the Analog Inputs on Robotino.
% Robotino can be equipped with inductive sensors which can then detect a
% metallic line on the floor and follow it.

%%
% 
% <<../images/linefollow_example.png>>
% 

%% Description
% There are 8 Analog Inputs available on Robotino (see figure below: AIN1 - AIN8). 
% The analog inputs can be connected to various devices/detectors and values can 
% be read from them. For instance, Robotino could be equipped with inductive 
% sensors connected to its analog inputs.
%%
% 
% <<../images/robotino_io_connector.png>>
%
%%
% The inductive sensors are connected to two of the analog inputs 0 (AIN1) and 1 (AIN2). 
% Inductive sensor 0 is located on the front of robot and inductive sensor 1 
% is located at the center of the robot. We receive readings from inductive sensor 0. 
% If the sensor is directly above the black metallic line, then a reading of 
% 2.00195 is read and if the sensor is not above a  metallic line, then a reading 
% of 9.95117 is received.
%
% Once the reading is received, it is subtracted by 5.97656 (average of 
% 2.00195 and 9.95117) and then multiplied by a scaling factor of 3. The end 
% result is then set as input for the Omega value for the OmniDrive_setVelocity 
% function. A constant speed of 100 mm/s in the X direction is also set. This 
% ensures that the robot is always following the line and rotates in the direction 
% of the line.

%% Code explanation
% First we will need to construct objects that we will be requiring in our
% program. In this program, we will require objects of |Com|, |OmniDrive|,
% |AnalogInput| and |Bumper|. In case of |AnalogInput| we will also need to
% specify the sensor number. This is done as follows.

ComId = Com_construct;
OmniDriveId = OmniDrive_construct;
AnalogInputId = AnalogInput_construct(0);
BumperId = Bumper_construct;

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
% Once we are connected to Robotino, we need to bind each of the object we
% created to Robotino using the ComId. This can be done as follows.
% 

OmniDrive_setComId(OmniDriveId, ComId);
AnalogInput_setComId(AnalogInputId, ComId);
Bumper_setComId(BumperId, ComId);

%%
% 
% We then start our "stop watch" to limit the example execution to 60
% seconds.
% 

tStart = tic;

%%
% 
% We initiate a while loop based on the condition that Robotino's bumper
% hasn't detected a collision. We obtain the reading from the analog input
% and perform the math operations described in the "Description" above and
% move Robotino using the OmniDrive_setVelocity function.

while (Bumper_value(BumperId) ~= 1)
    tElapsed = toc(tStart);
    % If 60 seconds are elapsed then exit while loop
    if(tElapsed >= 60 )
        break;
    end;
    
    value = AnalogInput_value(AnalogInputId);
    % Subtract average and scale reading
    value = (value - 5.97656) * 3;
    OmniDrive_setVelocity(OmniDriveId, 0.1, 0 ,value * pi / 180);
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

AnalogInput_destroy(AnalogInputId);
Bumper_destroy(BumperId);
OmniDrive_destroy(OmniDriveId);
Com_destroy(ComId);

%% Video
% A video of this example running can be viewed on
% <http://www.youtube.com/watch?v=wfKqx-bjTWk youtube> .