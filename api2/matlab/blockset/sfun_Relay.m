function sfun_relay(block)

setup(block);
  
%endfunction

function setup(block) 

    % Register number of ports
  block.NumInputPorts  = 2;
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
   
    % Register parameters
  block.NumDialogPrms     = 1;

  % Register sample times
  block.SampleTimes = [0 0];

  block.RegBlockMethod('CheckParameters', @CheckPrms);
  block.RegBlockMethod('InitializeConditions', @InitializeConditions);
  block.RegBlockMethod('Outputs', @Outputs);
  block.RegBlockMethod('Derivatives', @Derivatives);
  block.RegBlockMethod('Terminate', @Terminate);
  block.RegBlockMethod('PostPropagationSetup',    @DoPostPropSetup);
  
%endfunction

%//////////////////////////////////////////////////////////////////////////
function CheckPrms(block)

%endfunction

%//////////////////////////////////////////////////////////////////////////

function DoPostPropSetup(block)

  % Setup Dwork
  block.NumDworks = 1;
  block.Dwork(1).Name = 'ID'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

num = block.DialogPrm(1).Data;

% construct
RelayId =  Relay_construct( num );
disp( strcat( 'Created Relay.', 13, 'RelayId:', 32, num2str( RelayId ) ) );

block.Dwork(1).Data = RelayId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
RelayId = block.Dwork(1).Data;
ComId = block.InputPort(1).Data;

if ~( Relay_setComId( RelayId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect Relay', 32, num2str( RelayId ), 32, 'to com', 32, num2str( ComId ), '.' ) );
end;
if ~( Relay_setValue( RelayId, logical( block.InputPort(2).Data  ) ) == 1 )
    disp( strcat( 'ERROR: Could not set Relay state to', 32, num2str( block.InputPort(2).Data ), '.' ) ); 
end;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
RelayId = block.Dwork(1).Data;

% destroy relay
if ~( Relay_destroy( RelayId ) == 1 )
    disp( 'ERROR: Could not destroy Relay.' );
end;

%endfunction