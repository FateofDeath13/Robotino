function sfun_DistanceSensor(block)

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
  block.Dwork(1).Name = 'DisSensId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

num = block.DialogPrm(1).Data;

% construct 
DistanceSensorId =  DistanceSensor_construct( num );
disp( strcat( 'Created DistanceSensor.', 13, 'DistanceSensorId:', 32, num2str( DistanceSensorId ) ) );

block.Dwork(1).Data = DistanceSensorId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
DistanceSensorId = block.Dwork(1).Data;
ComId = block.InputPort(1).Data;

if ~( DistanceSensor_setComId( DistanceSensorId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect DistanceSensor', 32, num2str( DistanceSensorId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;

heading = DistanceSensor_heading( DistanceSensorId );
voltage = DistanceSensor_voltage( DistanceSensorId );
block.OutputPort(1).Data = voltage;
% disp( strcat( 'DistanceSensor', 32, num2str( heading ), '° :', 32, 'Voltage:', 32, num2str( voltage ) ) ); 

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
DistanceSensorId = block.Dwork(1).Data;

% destroy relay
if ~( DistanceSensor_destroy( DistanceSensorId ) == 1 )
    disp( 'ERROR: Could not destroy DistanceSensor.' );
end;

%endfunction