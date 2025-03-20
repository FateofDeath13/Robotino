function sfun_EncoderInput(block)

setup(block);
  
%endfunction

function setup(block) 

  % Register number of ports
  block.NumInputPorts  = 2; % ComId, ResetPosition
  block.NumOutputPorts = 2; % Velocity, Position
  
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
    
   % Override output port properties
  block.OutputPort(1).DatatypeID  = 0;  % double
  block.OutputPort(1).Complexity  = 'Real';
  block.OutputPort(1).SamplingMode = 0;
  block.OutputPort(2).DatatypeID  = 0;  % double
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
  block.Dwork(1).Name = 'EncoderInputId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

% construct
EncoderInputId = EncoderInput_construct;
disp( strcat( 'Created EncoderInput.', 13, 'EncoderInputId:', 32, num2str( EncoderInputId ) ) );

block.Dwork(1).Data = EncoderInputId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
EncoderInputId = block.Dwork(1).Data;
ComId = block.InputPort(1).Data;

resetPos = block.InputPort(2).Data;

% set comId
if ~( EncoderInput_setComId( EncoderInputId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect EncoderInput', 32, num2str( EncoderInputId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;
% reset position
if( resetPos == 1 )
    if ~( EncoderInput_resetPosition( EncoderInputId ) == 1 )
        disp( strcat( '(sim)', 32, 'ERROR: Could not reset position for EncoderInput', 32, num2str( EncoderInputId ), '.' ) );
    end;
end;

% output actual speed, actual position
actualSpeed = EncoderInput_velocity( EncoderInputId );
actualPos = EncoderInput_position( EncoderInputId );

block.OutputPort(1).Data = actualSpeed;
block.OutputPort(2).Data = actualPos;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
EncoderInputId = block.Dwork(1).Data;

% destroy 
if ~( EncoderInput_destroy( EncoderInputId ) == 1 )
    disp( 'ERROR: Could not destroy EncoderInput.' );
end

%endfunction