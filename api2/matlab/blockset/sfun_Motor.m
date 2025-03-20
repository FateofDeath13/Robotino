function sfun_Motor(block)

setup(block);
  
%endfunction

function setup(block) 

  % Register number of ports
  block.NumInputPorts  = 4; % ComId, Brake, ResetPosition, TargetSpeed
  block.NumOutputPorts = 3; % ActualSpped, ActualPosition, MotorCurrent
  
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
  block.NumDialogPrms     = 4;

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
  block.Dwork(1).Name = 'MotorId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

num = block.DialogPrm(1).Data;


% construct
MotorId = Motor_construct( num );
disp( strcat( 'Created Motor.', 13, 'MotorId:', 32, num2str( MotorId ) ) );

block.Dwork(1).Data = MotorId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
MotorId = block.Dwork(1).Data;
ComId   = block.InputPort(1).Data;

kp = block.DialogPrm(2).Data;
ki = block.DialogPrm(3).Data;
kd = block.DialogPrm(4).Data;

targetSpeed = block.InputPort(2).Data;
brake       = block.InputPort(3).Data;
resetPos    = block.InputPort(4).Data;

% set comId
if ~( Motor_setComId( MotorId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect Motor', 32, num2str( MotorId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;
% brake
if ~( Motor_setBrake( MotorId, brake ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not (re-)set brake for Motor', 32, num2str( MotorId ), '.' ) );
end;
% set PID
if ~( Motor_setPID( MotorId, kp, ki, kd ) == 1 )
   disp( strcat( '(sim)', 32, 'ERROR: Could not set PID controller for Motor', 32, num2str( MotorId ), '.' ) );
end;
% set target speed (rpm)
if ~( Motor_setSetPointSpeed( MotorId, targetSpeed ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not set taget speed Motor', 32, num2str( MotorId ), '.' ) );
end;
% reset position
if( resetPos == 1 )
    if ~( Motor_resetPosition( MotorId ) == 1 )
        disp( strcat( '(sim)', 32, 'ERROR: Could not reset position for Motor', 32, num2str( MotorId ), '.' ) );
    end;
end;

% output actual speed, actual position, motor current
actualSpeed = Motor_actualSpeed( MotorId );
actualPos = Motor_actualPosition( MotorId );
current = Motor_motorCurrent( MotorId );

block.OutputPort(1).Data = actualSpeed;
block.OutputPort(2).Data = actualPos;
block.OutputPort(3).Data = current;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
MotorId = block.Dwork(1).Data;

% destroy 
if ~( Motor_destroy( MotorId ) == 1 )
    disp( 'ERROR: Could not destroy Motor.' );
end

%endfunction