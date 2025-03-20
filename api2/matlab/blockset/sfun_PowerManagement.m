function sfun_PowerManagement(block)

setup(block);
  
%endfunction

function setup(block) 

    % Register number of ports
  block.NumInputPorts  = 1; % comId
  block.NumOutputPorts = 2; % voltage, current
  
  % Setup port properties to be inherited or dynamic
  block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;

  % Override input port properties
  block.InputPort(1).DatatypeID  = 0;  % double
  block.InputPort(1).Complexity  = 'Real';
  block.InputPort(1).SamplingMode = 0;
  block.InputPort(1).Dimensions = 1;
    
  % Override output port properties
  block.OutputPort(1).DatatypeID  = 0; % uint8
  block.OutputPort(1).Complexity  = 'Real';
  block.OutputPort(1).SamplingMode = 0;
  block.OutputPort(1).Dimensions = 1;
  block.OutputPort(2).DatatypeID  = 0; % uint8
  block.OutputPort(2).Complexity  = 'Real';
  block.OutputPort(2).SamplingMode = 0;
  block.OutputPort(2).Dimensions = 1;
  
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
  block.Dwork(1).Name = 'PowMgmtId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

% construct PowerManagement
PowerManagementId =  PowerManagement_construct;
disp( strcat( 'Created PowerManagement.', 13, 'PowerManagementId:', 32, num2str( PowerManagementId ) ) );

block.Dwork(1).Data = PowerManagementId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
PowerManagementId = block.Dwork(1).Data;
ComId = block.InputPort(1).Data;

% set ComId
if ~( PowerManagement_setComId( PowerManagementId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect PowerManagement', 32, num2str( PowerManagementId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;
% current, voltage
voltage = PowerManagement_voltage( PowerManagementId );
current = PowerManagement_current( PowerManagementId );
block.OutputPort(1).Data = voltage;
block.OutputPort(2).Data = current;
% disp( strcat( 'PowerManagement', 32, num2str( PowerManagementId ), ':', 32, 'Voltage:', 32, num2str( voltage ) ) ); 
% disp( strcat( 'PowerManagement', 32, num2str( PowerManagementId ), ':', 32, 'Current:', 32, num2str( current ) ) ); 

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
PowerManagementId = block.Dwork(1).Data;

% destroy PowerManagementId
if ~( PowerManagement_destroy( PowerManagementId ) == 1 )
    disp( 'ERROR: Could not destroy PowerManagement.' );
end;

%endfunction