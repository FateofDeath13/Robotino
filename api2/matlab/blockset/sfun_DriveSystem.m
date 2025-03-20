function sfun_DriveSystem(block)

setup(block);
  
%endfunction

function setup(block) 

  % Register number of ports
  block.NumInputPorts  = 4; % ComId, vx, vy, omega
  block.NumOutputPorts = 0;
  
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
disp( strcat( 'Created DriveSystem.', 13 ) );

block.Dwork(1).Data = OmniDriveId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
OmniDriveId = block.Dwork(1).Data;
ComId   = block.InputPort(1).Data;

vx = block.InputPort(2).Data;
vy       = block.InputPort(3).Data;
omega    = block.InputPort(4).Data;

% set comId
if ~( OmniDrive_setComId( OmniDriveId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect OmniDrive', 32, num2str( OmniDriveId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;
% brake
if ~( OmniDrive_setVelocity( OmniDriveId, vx, vy, omega ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not (re-)set setVelocity for OmniDrive', 32, num2str( OmniDriveId ), '.' ) );
end;

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