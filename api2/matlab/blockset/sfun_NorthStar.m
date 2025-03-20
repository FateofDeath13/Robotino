function sfun_NorthStar(block)

setup(block);
  
%endfunction

function setup(block) 

  % Register number of ports
  block.NumInputPorts  = 3; % ComId, roomId, ceilingCal
  block.NumOutputPorts = 8; % sequenceNo, roomID, numSpotsVisible, posX, posY, posTheta, magSpot0, magSpot1
  
  % Setup port properties to be inherited or dynamic
  % block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;

  % Override input port properties
  block.InputPort(1).DatatypeID  = 0;  % double
  block.InputPort(1).Complexity  = 'Real';
  block.InputPort(1).SamplingMode = 0;
  
  block.InputPort(2).DatatypeID  = 6;  % int32
  block.InputPort(2).Complexity  = 'Real';
  block.InputPort(2).SamplingMode = 0;
  
  block.InputPort(3).DatatypeID  = 1;  % single
  block.InputPort(3).Complexity  = 'Real';
  block.InputPort(3).SamplingMode = 0;
  
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
  
  block.OutputPort(4).DatatypeID  = 0;  % double
  block.OutputPort(4).Complexity  = 'Real';
  block.OutputPort(4).SamplingMode = 0;
  
  block.OutputPort(5).DatatypeID  = 0;  % double
  block.OutputPort(5).Complexity  = 'Real';
  block.OutputPort(5).SamplingMode = 0;
  
  block.OutputPort(6).DatatypeID  = 0;  % double
  block.OutputPort(6).Complexity  = 'Real';
  block.OutputPort(6).SamplingMode = 0;
  
  block.OutputPort(7).DatatypeID  = 0;  % double
  block.OutputPort(7).Complexity  = 'Real';
  block.OutputPort(7).SamplingMode = 0;
  
  block.OutputPort(8).DatatypeID  = 0;  % double
  block.OutputPort(8).Complexity  = 'Real';
  block.OutputPort(8).SamplingMode = 0;

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
  block.Dwork(1).Name = 'NorthStarId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

% construct
NorthStarId = NorthStar_construct;
disp( strcat( 'Created NorthStar.', 13, 'NorthStarId:', 32, num2str( NorthStarId ) ) );

block.Dwork(1).Data = NorthStarId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
NorthStarId = block.Dwork(1).Data;

comId   = block.InputPort(1).Data;
roomId = block.InputPort(2).Data;
ceilingCal = block.InputPort(3).Data;

% set comId
if ~( NorthStar_setComId( NorthStarId, comId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect NorthStar', 32, num2str( NorthStarId ), 32, 'to Com', 32, num2str( comId ), '.' ) );
end;
% set roomId
if ~( NorthStar_setRoomId( NorthStarId, roomId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not set roomId for NorthStar', 32, num2str( NorthStarId ), '.' ) );
end;
% set ceilingCal
if ~( NorthStar_setCeilingCal( NorthStarId, ceilingCal ) == 1 )
   disp( strcat( '(sim)', 32, 'ERROR: Could not set ceilingCal for NorthStar', 32, num2str( NorthStarId ), '.' ) );
end;

% Output: sequenceNo, roomID, numSpotsVisible, posX, posY, posTheta,
% magSpot0, magSpot1

block.OutputPort(1).Data = NorthStar_sequenceNo( NorthStarId );
block.OutputPort(2).Data = NorthStar_roomId( NorthStarId );
block.OutputPort(3).Data = NorthStar_numSpotsVisible( NorthStarId );
block.OutputPort(4).Data = NorthStar_posX( NorthStarId );
block.OutputPort(5).Data = NorthStar_posY( NorthStarId );
block.OutputPort(6).Data = NorthStar_posTheta( NorthStarId );
block.OutputPort(7).Data = NorthStar_magSpot0( NorthStarId );
block.OutputPort(8).Data = NorthStar_magSpot1( NorthStarId );

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
NorthStarId = block.Dwork(1).Data;

% destroy 
if ~( NorthStar_destroy( NorthStarId ) == 1 )
    disp( 'ERROR: Could not destroy NorthStar.' );
end

%endfunction