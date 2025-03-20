function sfun_AnalogInput(block)

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
  block.OutputPort(1).DatatypeID  = 0;  % double
  block.OutputPort(1).Complexity  = 'Real';
  block.OutputPort(1).SamplingMode = 0;
   
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
  block.Dwork(1).Name = 'AnalogInputId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

num = block.DialogPrm(1).Data;

% construct 
AnalogInputId =  AnalogInput_construct( num );
disp( strcat( 'Created AnalogInput.', 13, 'AnalogInputId:', 32, num2str( AnalogInputId ) ) );

block.Dwork(1).Data = AnalogInputId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
AnalogInputId = block.Dwork(1).Data;
ComId = block.InputPort(1).Data;

if ~( AnalogInput_setComId( AnalogInputId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect AnalogInput', 32, num2str( AnalogInputId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;
value = AnalogInput_value( AnalogInputId );
block.OutputPort(1).Data = value;
% disp( strcat( '(sim) AnalogInput', 32, num2str( AnalogInputId ), 32, 'has input value', 32, num2str( value ), '.' ) ); 


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
AnalogInputId = block.Dwork(1).Data;

% destroy relay
if ~( AnalogInput_destroy( AnalogInputId ) == 1 )
    disp( 'ERROR: Could not destroy AnalogInput.' );
end;

%endfunction