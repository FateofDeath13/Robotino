function sfun_Bumper(block)

setup(block);
  
%endfunction

function setup(block) 

    % Register number of ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 1;
  
  % Setup port properties to be inherited or dynamic
  % block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;

  % Override input port properties
  block.InputPort(1).DatatypeID  = 0;  % double
  block.InputPort(1).Complexity  = 'Real';
  block.InputPort(1).SamplingMode = 0;
  
  % Override output port properties
  block.OutputPort(1).DatatypeID  = 0; % double
  block.OutputPort(1).Complexity  = 'Real';
  block.OutputPort(1).SamplingMode = 0;

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
  block.Dwork(1).Name = 'BumperId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

% construct
BumperId =  Bumper_construct;
disp( strcat( 'Created Bumper.', 13, 'BumperId:', 32, num2str( BumperId ) ) );

block.Dwork(1).Data = BumperId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
BumperId = block.Dwork(1).Data;
ComId = block.InputPort(1).Data;

if ~( Bumper_setComId( BumperId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect Bumper', 32, num2str( BumperId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;
block.OutputPort(1).Data = double( Bumper_value( BumperId ) );

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
BumperId = block.Dwork(1).Data;

% destroy bumper
if ~( Bumper_destroy( BumperId ) == 1 )
    disp( 'ERROR: Could not destroy Bumper.' );
end;

%endfunction