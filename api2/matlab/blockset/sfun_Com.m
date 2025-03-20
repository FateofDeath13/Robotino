function sfun_Com(block)

setup(block);
  
%endfunction

function setup(block) 

   % Register number of ports
  block.NumInputPorts  = 0;
  block.NumOutputPorts = 1;
  
  % Setup port properties to be inherited or dynamic
  % block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;
  
  % Override output port properties
  block.OutputPort(1).DatatypeID  = 0; % double
  block.OutputPort(1).Complexity  = 'Real';
  block.OutputPort(1).SamplingMode = 0;

  % Register parameters
  block.NumDialogPrms     = 1;
  block.DialogPrmsTunable = {'Nontunable'};

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
  block.Dwork(1).Name = 'ComId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

% get parameters
Ip = block.DialogPrm(1).Data;

% construct com
ComId =  Com_construct;
disp( strcat( 'Created Com with ComId', 32, num2str( ComId ), 32, '.' ) );

% get image server port
Port = 8080 + ComId;

% set com address
if ~( Com_setAddress( ComId, Ip ) == 1 )
     disp( strcat( 'ERROR: Could not set Com address to', 32, Ip, '.' ) );
end;

% connect com to address
if ~( Com_connect( ComId ) == 1 )
    disp( strcat( 'ERROR: Could not connect Com to', 32, Ip, '.' ) );
end;

block.Dwork(1).Data = ComId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)

block.OutputPort(1).Data = block.Dwork(1).Data;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)

% disconnect com
if ~( Com_disconnect( block.Dwork(1).Data ) == 1 )
    disp( 'ERROR: Could not disconnect Com' );
end
% destroy com
if ~( Com_destroy( block.Dwork(1).Data ) == 1 )
    disp( 'ERROR: Could not destroy Com' );
end

%endfunction