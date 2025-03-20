function sfun_Odometry(block)

setup(block);
  
%endfunction

function setup(block) 

  % Register number of ports
  block.NumInputPorts  = 5; % comId, x, y, phi, set
  block.NumOutputPorts = 3; % x, y, phi
  
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
  block.InputPort(5).DatatypeID  = 0;  % double
  block.InputPort(5).Complexity  = 'Real';
  block.InputPort(5).SamplingMode = 0;
    
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
  block.Dwork(1).Name = 'OdometryId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

% construct
OdometryId = Odometry_construct;
disp( strcat( 'Created Odometry.', 13, 'OdometryId:', 32, num2str( OdometryId ) ) );

% set to zero position
Odometry_set( OdometryId, 0, 0, 0 );
disp( 'Initialized Odometry with zero position.' );

block.Dwork(1).Data = OdometryId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
OdometryId = block.Dwork(1).Data;
ComId   = block.InputPort(1).Data;

% set comId
if ~( Odometry_setComId( OdometryId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect Odometry', 32, num2str( OdometryId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;

% get odometry data
[x, y, phi] = Odometry_get( OdometryId );
block.OutputPort(1).Data = x;
block.OutputPort(2).Data = y;
block.OutputPort(3).Data = phi;
% disp( strcat( 'Odometry', 32, num2str( OdometryId ), ':', 32, 'X:', 32, num2str( x ) ) ); 
% disp( strcat( 'Odometry', 32, num2str( OdometryId ), ':', 32, 'Y:', 32, num2str( y ) ) ); 
% disp( strcat( 'Odometry', 32, num2str( OdometryId ), ':', 32, 'Phi:', 32, num2str( phi ) ) ); 

if( block.InputPort(2).Data == 1 )
    x = block.InputPort(3).Data;
    y = block.InputPort(4).Data;
    phi = block.InputPort(5).Data;
    if ~( Odometry_set( OdometryId, x, y, phi ) == 1 )
        disp( strcat( '(sim)', 32, 'ERROR: Could not set Odometry', 32, num2str( OdometryId ), 32, 'to set position.' ) );
    end;
end;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
OdometryId = block.Dwork(1).Data;

% destroy 
if ~( Odometry_destroy( OdometryId ) == 1 )
    disp( 'ERROR: Could not destroy Odometry.' );
end

%endfunction