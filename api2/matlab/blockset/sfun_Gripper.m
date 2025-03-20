function sfun_Gripper(block)

setup(block);
  
%endfunction

function setup(block) 

    % Register number of ports
  block.NumInputPorts  = 3;
  block.NumOutputPorts = 2;
  
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
  
  % Override output port properties
  block.OutputPort(1).DatatypeID  = 0; % double
  block.OutputPort(1).Complexity  = 'Real';
  block.OutputPort(1).SamplingMode = 0;
  block.OutputPort(2).DatatypeID  = 0; % double
  block.OutputPort(2).Complexity  = 'Real';
  block.OutputPort(2).SamplingMode = 0;

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
  block.Dwork(1).Name = 'GripperId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

% construct
GripperId =  Gripper_construct;
disp( strcat( 'Created Gripper.', 13, 'GripperId:', 32, num2str( GripperId ) ) );

block.Dwork(1).Data = GripperId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
GripperId = block.Dwork(1).Data;
ComId = block.InputPort(1).Data;

if ~( Gripper_setComId( GripperId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect Gripper', 32, num2str( GripperId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;

if( block.InputPort(2).Data == 1 ) % enable
    if( block.InputPort(3).Data == 1 ) % close-command
        if ~( Gripper_close( GripperId ) == 1 )
            disp( strcat( '(sim)', 32, 'ERROR: Could not close Gripper', 32, num2str( GripperId ), '.' ) );
        end;
    elseif( block.InputPort(3).Data == 0 ) % open-command
        if ~( Gripper_open( GripperId ) == 1 )
            disp( strcat( '(sim)', 32, 'ERROR: Could not open Gripper', 32, num2str( GripperId ), '.' ) );
        end;
    else
        disp( '(sim) ERROR: Expecting 0 or 1 at InputPort(3).' );
    end;
else
    disp( '(sim) WARNING: Gripper disabled.' );
end;

block.OutputPort(1).Data = double( Gripper_isOpened( GripperId ) );
block.OutputPort(2).Data = double( Gripper_isClosed( GripperId ) );

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
GripperId = block.Dwork(1).Data;

% destroy
if ~( Gripper_destroy( GripperId ) == 1 )
    disp( 'ERROR: Could not destroy Gripper.' );
end;

%endfunction