function sfun_Camera(block)

setup(block);
  
%endfunction

function setup(block) 

    % Register number of ports
  block.NumInputPorts  = 2; % comId, monitor_enable
  block.NumOutputPorts = 3; % image(r,g,b)
  
  % Setup port properties to be inherited or dynamic
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;

  % Override input port properties
  block.InputPort(1).DatatypeID  = 0;  % double
  block.InputPort(1).Complexity  = 'Real';
  block.InputPort(1).SamplingMode = 0;
  block.InputPort(1).Dimensions = 1;
   block.InputPort(2).DatatypeID  = 0;  % double
  block.InputPort(2).Complexity  = 'Real';
  block.InputPort(2).SamplingMode = 0;
  block.InputPort(2).Dimensions = 1;
  
  % Override output port properties
  block.OutputPort(1).DatatypeID  = 3; % uint8
  block.OutputPort(1).Dimensions = [240 320];
  block.OutputPort(1).Complexity  = 'Real';
  block.OutputPort(1).SamplingMode = 'Sample';
  block.OutputPort(2).DatatypeID  = 3; % uint8
  block.OutputPort(2).Dimensions = [240 320];
  block.OutputPort(2).Complexity  = 'Real';
  block.OutputPort(2).SamplingMode = 'Sample';
  block.OutputPort(3).DatatypeID  = 3; % uint8
  block.OutputPort(3).Dimensions = [240 320];
  block.OutputPort(3).Complexity  = 'Real';
  block.OutputPort(3).SamplingMode = 'Sample';

  % Register parameters
  block.NumDialogPrms     = 0;
  % block.DialogPrmsTunable = {'Nontunable'};
  block.SampleTimes = [0 0];

  block.RegBlockMethod('CheckParameters', @CheckPrms);
  block.RegBlockMethod('InitializeConditions', @InitializeConditions);
  block.RegBlockMethod('Outputs', @Outputs);
  block.RegBlockMethod('Derivatives', @Derivatives);
  block.RegBlockMethod('Terminate', @Terminate);
  block.RegBlockMethod('PostPropagationSetup', @DoPostPropSetup);
  
%endfunction

%//////////////////////////////////////////////////////////////////////////
function CheckPrms(block)

%endfunction

%//////////////////////////////////////////////////////////////////////////

function DoPostPropSetup(block)

  % Setup Dwork
  block.NumDworks = 1;
  block.Dwork(1).Name = 'CameraId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

% construct camera
CameraId =  Camera_construct;
disp( strcat( 'Created Camera.', 13, 'CameraId:', 32, num2str( CameraId ) ) );

block.Dwork(1).Data = CameraId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
CameraId = block.Dwork(1).Data;
ComId = block.InputPort(1).Data;

% get monitor_enable signal
monitor = block.InputPort(2).Data;
% get ComId
if ~( Camera_setComId( CameraId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect Camera', 32, num2str( CameraId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;
% get image if available
if( Camera_grab( CameraId ) == 1 )
%     disp( '(sim) Receiving image.' );
    img = Camera_getImage( CameraId );
    r = uint8( zeros( 240, 320 ) );
    g = uint8( zeros( 240, 320 ) );
    b = uint8( zeros( 240, 320 ) );
    r(:,:) = img(:,:,1);
    g(:,:) = img(:,:,2);
    b(:,:) = img(:,:,3);
    block.OutputPort(1).Data = r;
    block.OutputPort(2).Data = g;
    block.OutputPort(3).Data = b;
    % show image if monitor == on
    if( monitor == 1 ) 
        image( img );
    end;
else
%     disp( '(sim) No image available.' );
end;
%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
CameraId = block.Dwork(1).Data;

% destroy camera
if ~( Camera_destroy( CameraId ) == 1 )
    disp( 'ERROR: Could not destroy Camera.' );
end;

%endfunction