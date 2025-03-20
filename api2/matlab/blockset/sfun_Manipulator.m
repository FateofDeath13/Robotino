function sfun_Manipulator(block)

setup(block);
  
%endfunction

function setup(block) 

    % Register number of ports
  block.NumInputPorts  = 5; % ComId, angles, numAngles, speeds, numSpeeds
  block.NumOutputPorts = 13;
  
  % Setup port properties to be inherited or dynamic
  % block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;

  % Override input port properties
  block.InputPort(1).DatatypeID  = 0;  % double
  block.InputPort(1).Complexity  = 'Real';
  block.InputPort(1).SamplingMode = 0;
  block.InputPort(1).Dimensions = 1;
  
  block.InputPort(2).DatatypeID  = 1;  % single
  block.InputPort(2).Complexity  = 'Real';
  block.InputPort(2).SamplingMode = 'Sample';
  block.InputPort(2).Dimensions = [9 1];
  
  block.InputPort(3).DatatypeID  = 7;  % uint32
  block.InputPort(3).Complexity  = 'Real';
  block.InputPort(3).SamplingMode = 0;
  block.InputPort(3).Dimensions = 1;
  
  block.InputPort(4).DatatypeID  = 1;  % single
  block.InputPort(4).Complexity  = 'Real';
  block.InputPort(4).SamplingMode = 'Sample';
  block.InputPort(4).Dimensions = [9 1];
  
  block.InputPort(5).DatatypeID  = 7;  % uint32
  block.InputPort(5).Complexity  = 'Real';
  block.InputPort(5).SamplingMode = 0;
  block.InputPort(5).Dimensions = 1;
  
  % Override output port properties
  block.OutputPort(1).DatatypeID  = 7;  % uint32
  block.OutputPort(1).Complexity  = 'Real';
  block.OutputPort(1).SamplingMode = 0;
  block.OutputPort(1).Dimensions = 1;
  
  block.OutputPort(2).DatatypeID  = 1; % single
  block.OutputPort(2).Complexity  = 'Real';
  block.OutputPort(2).SamplingMode = 'Sample';
  block.OutputPort(2).Dimensions = [9 1];
  
  block.OutputPort(3).DatatypeID  = 7;  % uint32
  block.OutputPort(3).Complexity  = 'Real';
  block.OutputPort(3).SamplingMode = 0;
  block.OutputPort(3).Dimensions = 1;
  
  block.OutputPort(4).DatatypeID  = 1; % single
  block.OutputPort(4).Complexity  = 'Real';
  block.OutputPort(4).SamplingMode = 'Sample';
  block.OutputPort(4).Dimensions = [9 1];
  
  block.OutputPort(5).DatatypeID  = 7;  % uint32
  block.OutputPort(5).Complexity  = 'Real';
  block.OutputPort(5).SamplingMode = 0;
  block.OutputPort(5).Dimensions = 1;
  
  block.OutputPort(6).DatatypeID  = 6; % int32
  block.OutputPort(6).Complexity  = 'Real';
  block.OutputPort(6).SamplingMode = 'Sample';
  block.OutputPort(6).Dimensions = [9 1];
  
  block.OutputPort(7).DatatypeID  = 7;  % uint32
  block.OutputPort(7).Complexity  = 'Real';
  block.OutputPort(7).SamplingMode = 0;
  block.OutputPort(7).Dimensions = 1;
  
  block.OutputPort(8).DatatypeID  = 6; % int32
  block.OutputPort(8).Complexity  = 'Real';
  block.OutputPort(8).SamplingMode = 0;
  block.OutputPort(8).Dimensions = 1;
  
  block.OutputPort(9).DatatypeID  = 6; % int32
  block.OutputPort(9).Complexity  = 'Real';
  block.OutputPort(9).SamplingMode = 0;
  block.OutputPort(9).Dimensions = 1;
  
  block.OutputPort(10).DatatypeID  = 1; % single
  block.OutputPort(10).Complexity  = 'Real';
  block.OutputPort(10).SamplingMode = 'Sample';
  block.OutputPort(10).Dimensions = [9 1];
  
  block.OutputPort(11).DatatypeID  = 7;  % uint32
  block.OutputPort(11).Complexity  = 'Real';
  block.OutputPort(11).SamplingMode = 0;
  block.OutputPort(11).Dimensions = 1;
  
  block.OutputPort(12).DatatypeID  = 1; % single
  block.OutputPort(12).Complexity  = 'Real';
  block.OutputPort(12).SamplingMode = 'Sample';
  block.OutputPort(12).Dimensions = [9 1];
  
  block.OutputPort(13).DatatypeID  = 7;  % uint32
  block.OutputPort(13).Complexity  = 'Real';
  block.OutputPort(13).SamplingMode = 0;
  block.OutputPort(13).Dimensions = 1;
  

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
  block.Dwork(1).Name = 'ManipulatorId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;
  
%   block.Dwork(2).Name = 'in_angles'; 
%   block.Dwork(2).Dimensions      = 9;
%   block.Dwork(2).DatatypeID      = 1;
%   block.Dwork(2).Complexity      = 'Real';
%   block.Dwork(2).UsedAsDiscState = false;
%   
%   block.Dwork(3).Name = 'in_numAngles'; 
%   block.Dwork(3).Dimensions      = 1;
%   block.Dwork(3).DatatypeID      = 7;
%   block.Dwork(3).Complexity      = 'Real';
%   block.Dwork(3).UsedAsDiscState = false;
%   
%   block.Dwork(4).Name = 'in_speeds'; 
%   block.Dwork(4).Dimensions      = 9;
%   block.Dwork(4).DatatypeID      = 1;
%   block.Dwork(4).Complexity      = 'Real';
%   block.Dwork(4).UsedAsDiscState = false;
%   
%   block.Dwork(5).Name = 'in_numSpeeds'; 
%   block.Dwork(5).Dimensions      = 1;
%   block.Dwork(5).DatatypeID      = 7;
%   block.Dwork(5).Complexity      = 'Real';
%   block.Dwork(5).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

% construct
ManipulatorId =  Manipulator_construct;
disp( strcat( 'Created Manipulator.', 13, 'ManipulatorId:', 32, num2str( ManipulatorId ) ) );

block.Dwork(1).Data = ManipulatorId;
% block.InputPort(2).Data = single([[0 0 0 0 0 0 0 0 0]']);
% block.InputPort(3).Data = uint32([0]);
% block.InputPort(4).Data = single([[0 0 0 0 0 0 0 0 0]']);
% block.InputPort(5).Data = uint32([0]);

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
ManipulatorId = block.Dwork(1).Data;
ComId = block.InputPort(1).Data;
% block.Dwork(2).Data = block.InputPort(2).Data;
% block.Dwork(3).Data = block.InputPort(3).Data;
% block.Dwork(4).Data = block.InputPort(4).Data;
% block.Dwork(5).Data = block.InputPort(5).Data;

seq = zeros(1,1);
angles = zeros(9,1);
numAngles = zeros(1,1);
speeds = zeros(9,1);
numSpeeds = zeros(1,1);
errors = zeros(9,1);
numErrors = zeros(1,1);
motors_enabled = zeros(1,1);
store_current_position = zeros(1,1);
cwAxesLimits = zeros(9,1);
numCwAxesLimits = zeros(1,1);
ccwAxesLimits = zeros(9,1);
numCcwAxesLimits = zeros(1,1);

if ~( Manipulator_setComId( ManipulatorId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect Manipulator', 32, num2str( ManipulatorId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;
if (Manipulator_grab(ManipulatorId) == 1)
    [ return_value, seq, angles, numAngles, speeds, numSpeeds, errors, numErrors, motors_enabled, store_current_position, cwAxesLimits, numCwAxesLimits, ccwAxesLimits, numCcwAxesLimits ] = Manipulator_getReadings( ManipulatorId );
    if ( return_value == 1 )
        block.OutputPort(1).Data = seq;
        block.OutputPort(2).Data = angles;
        block.OutputPort(3).Data = numAngles;
        block.OutputPort(4).Data = speeds;
        block.OutputPort(5).Data = numSpeeds;
        block.OutputPort(6).Data = errors;
        block.OutputPort(7).Data = numErrors;
        block.OutputPort(8).Data = motors_enabled;
        block.OutputPort(9).Data = store_current_position;
        block.OutputPort(10).Data = cwAxesLimits;
        block.OutputPort(11).Data = numCwAxesLimits;
        block.OutputPort(12).Data = ccwAxesLimits;
        block.OutputPort(13).Data = numCcwAxesLimits;  
    end;
end;

if ~( size(block.InputPort(2).Data,1) < 9  || size(block.InputPort(4).Data,1) < 9)
    if ~(Manipulator_setAxes( ManipulatorId, block.InputPort(2).Data, block.InputPort(3).Data, block.InputPort(4).Data, block.InputPort(5).Data ) == 1)
            disp( strcat( '(sim)', 32, 'ERROR: setAxes failed' ));
    end;
end;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
ManipulatorId = block.Dwork(1).Data;

% destroy bumper
if ~( Manipulator_destroy( ManipulatorId ) == 1 )
    disp( 'ERROR: Could not destroy Manipulator.' );
end;

%endfunction