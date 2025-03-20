function sfun_LaserRangeFinder(block)

setup(block);
  
%endfunction

function setup(block) 

    % Register number of ports
  block.NumInputPorts  = 1;
  block.NumOutputPorts = 13;
  
  % Setup port properties to be inherited or dynamic
  % block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;

  % Override input port properties
  block.InputPort(1).DatatypeID  = 0;  % double
  block.InputPort(1).Complexity  = 'Real';
  block.InputPort(1).SamplingMode = 0;
  block.InputPort(1).Dimensions = 1;
  
  % Override output port properties
  block.OutputPort(1).DatatypeID  = 7;  % uint32
  block.OutputPort(1).Complexity  = 'Real';
  block.OutputPort(1).SamplingMode = 0;
  block.OutputPort(1).Dimensions = 1;
  
  block.OutputPort(2).DatatypeID  = 7;  % uint32
  block.OutputPort(2).Complexity  = 'Real';
  block.OutputPort(2).SamplingMode = 0;
  block.OutputPort(2).Dimensions = 1;
  
  block.OutputPort(3).DatatypeID  = 1; % single
  block.OutputPort(3).Complexity  = 'Real';
  block.OutputPort(3).SamplingMode = 0;
  block.OutputPort(3).Dimensions = 1;
  
  block.OutputPort(4).DatatypeID  = 1; % single
  block.OutputPort(4).Complexity  = 'Real';
  block.OutputPort(4).SamplingMode = 0;
  block.OutputPort(4).Dimensions = 1;
  
  block.OutputPort(5).DatatypeID  = 1; % single
  block.OutputPort(5).Complexity  = 'Real';
  block.OutputPort(5).SamplingMode = 0;
  block.OutputPort(5).Dimensions = 1;
  
  block.OutputPort(6).DatatypeID  = 1; % single
  block.OutputPort(6).Complexity  = 'Real';
  block.OutputPort(6).SamplingMode = 0;
  block.OutputPort(6).Dimensions = 1;
  
  block.OutputPort(7).DatatypeID  = 1; % single
  block.OutputPort(7).Complexity  = 'Real';
  block.OutputPort(7).SamplingMode = 0;
  block.OutputPort(7).Dimensions = 1;
  
  block.OutputPort(8).DatatypeID  = 1; % single
  block.OutputPort(8).Complexity  = 'Real';
  block.OutputPort(8).SamplingMode = 0;
  block.OutputPort(8).Dimensions = 1;
  
  block.OutputPort(9).DatatypeID  = 1; % single
  block.OutputPort(9).Complexity  = 'Real';
  block.OutputPort(9).SamplingMode = 0;
  block.OutputPort(9).Dimensions = 1;
  
  block.OutputPort(10).DatatypeID  = 1; % single
  block.OutputPort(10).Complexity  = 'Real';
  block.OutputPort(10).SamplingMode = 'Sample';
  block.OutputPort(10).Dimensions = [1000 1];
  
  block.OutputPort(11).DatatypeID  = 7;  % uint32
  block.OutputPort(11).Complexity  = 'Real';
  block.OutputPort(11).SamplingMode = 0;
  block.OutputPort(11).Dimensions = 1;
  
  block.OutputPort(12).DatatypeID  = 1; % single
  block.OutputPort(12).Complexity  = 'Real';
  block.OutputPort(12).SamplingMode = 'Sample';
  block.OutputPort(12).Dimensions = [1000 1];
  
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
  block.Dwork(1).Name = 'LRFId'; 
  block.Dwork(1).Dimensions      = 1;
  block.Dwork(1).DatatypeID      = 0;
  block.Dwork(1).Complexity      = 'Real';
  block.Dwork(1).UsedAsDiscState = false;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

% construct
LRFId =  LaserRangeFinder_construct;
disp( strcat( 'Created LaserRangeFinder.', 13, 'LaserRangeFinderId:', 32, num2str( LRFId ) ) );

block.Dwork(1).Data = LRFId;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)
LRFId = block.Dwork(1).Data;
ComId = block.InputPort(1).Data;

seq = zeros(1,1);
stamp = zeros(1,1);
angle_min = zeros(1,1);
angle_max = zeros(1,1);
angle_increment = zeros(1,1);
time_increment = zeros(1,1);
scan_time = zeros(1,1);
range_min = zeros(1,1);
range_max = zeros(1,1);
ranges = zeros(1000,1);
numRanges = zeros(1,1);
intensities = zeros(1000,1);
numIntensities = zeros(1,1);

if ~( LaserRangeFinder_setComId( LRFId, ComId ) == 1 )
    disp( strcat( '(sim)', 32, 'ERROR: Could not connect LaserRangeFinder', 32, num2str( LRFId ), 32, 'to Com', 32, num2str( ComId ), '.' ) );
end;
if (LaserRangeFinder_grab(LRFId) == 1)
    [ return_value, seq, stamp, angle_min, angle_max, angle_increment, time_increment, scan_time, range_min, range_max, ranges, numRanges, intensities, numIntensities ] = LaserRangeFinder_getReadings( LRFId );
    if ( return_value == 1 )
        block.OutputPort(1).Data = seq;
        block.OutputPort(2).Data = stamp;
        block.OutputPort(3).Data = angle_min;
        block.OutputPort(4).Data = angle_max;
        block.OutputPort(5).Data = angle_increment;
        block.OutputPort(6).Data = time_increment;
        block.OutputPort(7).Data = scan_time;
        block.OutputPort(8).Data = range_min;
        block.OutputPort(9).Data = range_max;
        block.OutputPort(10).Data = ranges;
        block.OutputPort(11).Data = numRanges;
        block.OutputPort(12).Data = intensities;
        block.OutputPort(13).Data = numIntensities;  
    end;
end;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)
LRFId = block.Dwork(1).Data;

% destroy bumper
if ~( LaserRangeFinder_destroy( LRFId ) == 1 )
    disp( 'ERROR: Could not destroy LaserRangeFinder.' );
end;

%endfunction