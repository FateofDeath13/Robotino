function sfun_PowerOutput(block)

setup(block);
  
%endfunction

function setup(block) 

    % Register number of ports
  block.NumInputPorts  = 2; % comId, setValue
  block.NumOutputPorts = 1; % current
  
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
  block.OutputPort(1).DatatypeID  = 0; % uint8
  block.OutputPort(1).Complexity  = 'Real';
  block.OutputPort(1).SamplingMode = 0;
  block.OutputPort(1).Dimensions = 1;
 
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
  block.Dwork(1).Name = 'PowerOutputId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

% construct PowerOutput
PowerOutputId =  PowerOutput_construct;
disp( strcat( 'Created PowerOutput.', 13, 'PowerOutputId:', 32, num2str( PowerOutputId ) ) );

block.Dwork(1).Data = PowerOutputId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
PowerOutputId = block.Dwork(1).Data;
ComId = block.InputPort(1).Data;

setPoint = block.InputPort(2).Data;

% set ComId
if ~( PowerOutput_setComId( PowerOutputId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect PowerOutput', 32, num2str( PowerOutputId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;
% set setPoint
if ~( PowerOutput_setValue( PowerOutputId, setPoint ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not set PowerOutput', 32, num2str( PowerOutputId ), 32, 'to value', 32, num2str( setPoint ), '.' ) );
end;
% current
current = PowerOutput_current( PowerOutputId );
block.OutputPort(1).Data = current;
% disp( strcat( 'PowerOutput', 32, num2str( PowerOutputId ), ':', 32, 'Current:', 32, num2str( current ) ) ); 

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
PowerOutputId = block.Dwork(1).Data;

% destroy PowerOutput
if ~( PowerOutput_destroy( PowerOutputId ) == 1 )
    disp( 'ERROR: Could not destroy PowerOutput.' );
end;

%endfunction