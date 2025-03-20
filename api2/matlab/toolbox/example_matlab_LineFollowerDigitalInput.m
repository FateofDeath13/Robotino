%% DigitalInput Example
% This example illustrates the use of the Digital Inputs on Robotino.
% The optical sensors, which are connected to the digital inputs, are used
% to detect a coloured line on the floor and follow it.
%%
%%
% 
% <<../images/linefollow_example.png>>
%

%% Description
% There are 8 Digital Inputs available on Robotino (see figure below: DI1 - DI8). 
% The digital inputs can be connected to various devices/detectors and values 
% can be read from them. For instance, Robotino could be equipped with optical 
% sensors connected to its digital inputs.

%%
% 
% <<../images/robotino_io_connector.png>>
%
%%
% 
% There are two optical sensors on Robotino which are connected to digital
% inputs 0 (DIN1) and 1 (DIN2). They both are located next to each other at 
% the front of the robot. The optical sensors output false (0) when they are 
% directly above the black line (black in our case) and true (1) when they 
% are not. Using the readings from both the sensors, we can rotate the robot 
% clockwise or counter-clockwise with a constant velocity of 100mm/s in the 
% X direction to achieve motion along the path of the line.
% 

%% Code explanation
% First we will need to construct objects that we will be requiring in our
% program. In this program, we will require objects of |Com|, |OmniDrive|,
% |DigitalInput| and |Bumper|. In case of |DigitalInput| we will also need
% to specify the sensor number. This is done as follows.

ComId = Com_construct;
OmniDriveId = OmniDrive_construct;
DigitalInput0Id = DigitalInput_construct(0);
DigitalInput1Id = DigitalInput_construct(1);
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
DigitalInput_setComId(DigitalInput0Id, ComId);
DigitalInput_setComId(DigitalInput1Id, ComId);
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
% hasn't detected a collision. We obtain the optical sensor readings from 
% the digital sensors of the robots. The idea is simple, if the left sensor
% outputs true (1), then we rotate right and if the right sensor outputs
% true (1), we rotate Robotino to the left. If both the sensors otuput
% false (0) that means Robotino is on the line and then we simply move
% Robotino forward.
while (Bumper_value(BumperId) ~= 1)
    tElapsed = toc(tStart);
    % If 60 seconds are elapsed then exit while loop
    if(tElapsed >= 60 )
        break;
    end;
    value0 = DigitalInput_value(DigitalInput0Id);
    value1 = DigitalInput_value(DigitalInput1Id);
	
    if (value0 | value1)
        if(value0)
            % Rotate Robotino to the left
            OmniDrive_setVelocity(OmniDriveId, 0.1, 0 ,10 * pi / 180);
        else
            % Rotate Robotino to the right
            OmniDrive_setVelocity(OmniDriveId, 0.1, 0 ,-10 * pi / 180);
        end
    else
        %Robotino is on the line, keep moving forward
        OmniDrive_setVelocity(OmniDriveId, 0.1, 0 ,0);
    end
   
end

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
DigitalInput_destroy(DigitalInput0Id);
DigitalInput_destroy(DigitalInput1Id);
Bumper_destroy(BumperId);
OmniDrive_destroy(OmniDriveId);
Com_destroy(ComId);
%% Video
% A video of this example running can be viewed on
% <http://www.youtube.com/watch?v=wfKqx-bjTWk youtube> .