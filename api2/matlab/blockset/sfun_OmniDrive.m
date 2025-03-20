function sfun_OmniDrive(block)

setup(block);
  
%endfunction

function setup(block) 

  % Register number of ports
  block.NumInputPorts  = 4;
  block.NumOutputPorts = 3;
  
  % Setup port properties to be inherited or dynamic
  % block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;

  % Override input port properties
  block.InputPort(1).DatatypeID  = 0;  % double
  block.InputPort(1).Complexity  = 'Real';
  block.InputPort(1).SamplingMode = 0;
  block.InputPort(2).DatatypeID  = 0;  % double
  block.InputPort(2).Complexity  = 'Real';
  block.InputPort(2).SamplingMode = 0;
  block.InputPort(3).DatatypeID  = 0;  % double
  block.InputPort(3).Complexity  = 'Real';
  block.InputPort(3).SamplingMode = 0;
  block.InputPort(4).DatatypeID  = 0;  % double
  block.InputPort(4).Complexity  = 'Real';
  block.InputPort(4).SamplingMode = 0;
  
   % Override output port properties
  block.OutputPort(1).DatatypeID  = 0;  % double
  block.OutputPort(1).Complexity  = 'Real';
  block.OutputPort(1).SamplingMode = 0;
  block.OutputPort(2).DatatypeID  = 0;  % double
  block.OutputPort(2).Complexity  = 'Real';
  block.OutputPort(2).SamplingMode = 0;
  block.OutputPort(3).DatatypeID  = 0;  % double
  block.OutputPort(3).Complexity  = 'Real';
  block.OutputPort(3).SamplingMode = 0;

  % Register parameters
  block.NumDialogPrms     = 0;

  % Register sample times
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
  block.Dwork(1).Name = 'OmniDriveId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

% construct
OmniDriveId = OmniDrive_construct;
disp( strcat( 'Created OmniDrive.', 13, 'OmniDriveId:', 32, num2str( OmniDriveId ) ) );

block.Dwork(1).Data = OmniDriveId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
OmniDriveId = block.Dwork(1).Data;
ComId   = block.InputPort(1).Data;

Vx      = block.InputPort(2).Data;
Vy      = block.InputPort(3).Data;
Omega   = block.InputPort(4).Data;
% set comId
if ~( OmniDrive_setComId( OmniDriveId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect OmniDrive', 32, num2str( OmniDriveId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;
% set velocity
% uncomment to use OmniDrive object for velocity adjustment!
% comment to use Motor objects for velocity adjustment!
% if ~( OmniDrive_setVelocity( OmniDriveId, Vx, Vy, Omega ) == 1 )
%     disp( '(sim) ERROR: Could not set OmniDrive velocities.' );
% end;
% get velocities in rpm
[v1, v2, v3] = OmniDrive_getVelocities( OmniDriveId, Vx / 1000, Vy / 1000, Omega / 180 * pi );
block.OutputPort(1).Data = v1;
block.OutputPort(2).Data = v2;
block.OutputPort(3).Data = v3;
%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
OmniDriveId = block.Dwork(1).Data;

% destroy 
if ~( OmniDrive_destroy( OmniDriveId ) == 1 )
    disp( 'ERROR: Could not destroy OmniDrive.' );
end

%endfunction