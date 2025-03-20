%% Camera Example
% This example illustrates the use of the Camera on Robotino.
% Robotino is equipped with a color camera with VGA resolution and using
% this Camera, we can make Robotino detect a black line on the floor.

%%
% 
% <<../images/linefollow_example.png>>
%

%% Description
% Using the color camera on Robotino, we can obtain images from Robotino.
% After obtaining the images, a Prewitt Edge Detector Filter is applied
% and the x-position of the line is calculated. Based on that the
% x-velocity, y-velocity and omega values are calculated for Robotino.

%% Code explanation
% First we will need to construct objects that we will be requiring in our
% program. In this program, we will require objects of |Com|, |OmniDrive|,
% |Camera| and |Bumper|. This is done as follows.

ComId = Com_construct;
OmniDriveId = OmniDrive_construct;
CameraId = Camera_construct;
BumperId = Bumper_construct;
%%
% Upon successful contruction of the objects, an Id is returned for each
% object. This Id is used later when communicating with Robotino. Now we
% need to set the address of Robotino and then connect to it. This is done
% as follows.
%%
% *Note the IP address and port number might be different*

Com_setAddress(ComId, '192.168.1.130');
Com_connect(ComId);

%%
% 
% Once we are connected to Robotino, we need to bind each of the object we
% created to Robotino using the ComId. This can be done as follows.
%

OmniDrive_setComId(OmniDriveId, ComId);
Camera_setComId(CameraId, ComId);
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
% hasn't detected a collision. And as explained in the 'Description'
% above, we obtain images from Robotino's camera, apply an edge detection
% filter, detect the x position of the line and move Robotino accordingly

while (Bumper_value(BumperId) ~= 1)
    tElapsed = toc(tStart);
    % If 60 seconds are elapsed then exit while loop
    if(tElapsed >= 5 )
        disp('Timeout');
        break;
    end;

    if (Camera_grab(CameraId) == 1)
        img = Camera_getImage( CameraId )
        image(img); title('An image from the camera onboard Robotino')
    end;
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
Camera_destroy(CameraId);
Bumper_destroy(BumperId);
OmniDrive_destroy(OmniDriveId);
Com_destroy(ComId);
%% Video
% A video of this example running can be viewed on
% <http://www.youtube.com/watch?v=wfKqx-bjTWk youtube> .