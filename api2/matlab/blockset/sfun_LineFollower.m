function sfun_lineDetector(block)

setup(block);
  
%endfunction

function setup(block) 

    % Register number of ports
  block.NumInputPorts  = 5; % image(r,g,b), threshold, bumper(=stop)
  block.NumOutputPorts = 3; % vx_soll, vy_soll, omega_soll
  
  % Setup port properties to be inherited or dynamic
  % block.SetPreCompInpPortInfoToDynamic;
  block.SetPreCompOutPortInfoToDynamic;

  % Override input port properties
  block.InputPort(1).DatatypeID  = 3;  % uint8
  block.InputPort(1).Dimensions = [240 320];
  block.InputPort(1).Complexity  = 'Real';
  block.InputPort(1).SamplingMode = 'Sample';
  block.InputPort(2).DatatypeID  = 3;  % uint8
  block.InputPort(2).Complexity  = 'Real';
  block.InputPort(2).SamplingMode = 'Sample';
  block.InputPort(2).Dimensions = [240 320];
  block.InputPort(3).DatatypeID  = 3;  % uint8
  block.InputPort(3).Complexity  = 'Real';
  block.InputPort(3).SamplingMode = 'Sample';
  block.InputPort(3).Dimensions = [240 320];
  block.InputPort(4).DatatypeID  = 0;  % double
  block.InputPort(4).Complexity  = 'Real';
  block.InputPort(4).SamplingMode = 0;
  block.InputPort(4).Dimensions = 1;
  block.InputPort(5).DatatypeID  = 0;  % double
  block.InputPort(5).Complexity  = 'Real';
  block.InputPort(5).SamplingMode = 0;
  block.InputPort(5).Dimensions = 1;
  
  % Override output port properties
  block.OutputPort(1).DatatypeID  = 0; % double
  block.OutputPort(1).Complexity  = 'Real';
  block.OutputPort(1).SamplingMode = 0;
  block.OutputPort(1).Dimensions = 1;
  block.OutputPort(2).DatatypeID  = 0; % double
  block.OutputPort(2).Complexity  = 'Real';
  block.OutputPort(2).SamplingMode = 0;
  block.OutputPort(2).Dimensions = 1;
  block.OutputPort(3).DatatypeID  = 0; % double
  block.OutputPort(3).Complexity  = 'Real';
  block.OutputPort(3).SamplingMode = 0;
  block.OutputPort(3).Dimensions = 1;

  % Register parameters
  block.NumDialogPrms     = 0;
  % block.DialogPrmsTunable = {'Nontunable'};

  % Register sample times
  %  [0 offset]            : Continuous sample time
  %  [positive_num offset] : Discrete sample time
  %
  %  [-1, 0]               : Port-based sample time
  %  [-2, 0]               : Variable sample time
  block.SampleTimes = [0 0];

  block.RegBlockMethod('CheckParameters', @CheckPrms);
  block.RegBlockMethod('InitializeConditions', @InitializeConditions);
  block.RegBlockMethod('Outputs', @Outputs);
  block.RegBlockMethod('Derivatives', @Derivatives);
  block.RegBlockMethod('Terminate', @Terminate);
  
%endfunction

%//////////////////////////////////////////////////////////////////////////
function CheckPrms(block)

%endfunction

%//////////////////////////////////////////////////////////////////////////
function InitializeConditions(block)

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Outputs(block)

% get input: image, threshold, bumper(=stop)
r           = block.InputPort(1).Data;
g           = block.InputPort(2).Data;
b           = block.InputPort(3).Data;
threshold   = block.InputPort(4).Data;
stop        = block.InputPort(5).Data;

img = zeros( 240, 320, 3 );
img(:,:,1) = r(:,:);
img(:,:,2) = g(:,:);
img(:,:,3) = b(:,:);

% Prewitt-Filter
Fx = [-1 0 1;-1 0 1;-1 0 1];
Fy = [-1 -1 -1;0 0 0;1 1 1];
% region of interest:
[m,n,c] = size( img );
roi = zeros(20,n,3);
roi = img(m-19:m,:,:);
% grayscale:
gray = zeros(20,n);
gray(:,:) = floor( (1/3)*( roi(:,:,1) + roi(:,:,2) + roi(:,:,3) ) );
% edge detection with Prewitt filters:
edge = zeros(20,n);
edge(:,:) = abs( floor( (1/2)*( convn(gray,Fx,'same')+convn(gray,Fy,'same') ) ) );
% threshold
bw = zeros(20,n);
for(i=1:20)
    for(j=1:n)
        if( edge(i,j) < threshold )
            bw(i,j) = 0;
        else
            bw(i,j) = 255;
        end;
    end;
end;
% calculate x-position of line:
sum = 0;
for(j=2:n-1)
    if( bw(1,j) == 0 )
        sum = sum + j;
        break;
    end;
end;
for(j=n-1:-1:2)
    if( bw(1,j) == 0 )
        sum = sum + j;
        break;
    end;
end;
for(j=2:n-1)
    if( bw(20,j) == 0 )
        sum = sum + j;
        break;
    end;
end;
for(j=n-1:-1:2)
    if( bw(20,j) == 0 )
        sum = sum + j;
        break;
    end;
end;
% detected x-position of line
posx = ceil(sum/4); 

% DEBUG / SHOW DETECTED LINE:
% For a b/w picture of the result copy bw to all three color channels
% of a 20xnx3-matrix and show it with the 'image'-command of MATLAB.
% bw3 = zeros(20,n,3);
% bw3(:,:,1) = bw(:,:);
% bw3(:,:,2) = bw(:,:);
% bw3(:,:,3) = bw(:,:);
% image( uint8( bw3 ) );


% calculate velocities
err = posx - round( length( img ) / 2 );
if( posx == 0 || posx == 320 )
    vx = 0;
    vy = 20;
    omega = sign( err )*(-10);
else
    if( (300 - abs( err )) > 10 )
        vx = 300 - abs( err );
    else
        vx = 10;
    end
    vy = floor( - err/2 );
    omega = floor( - err/2 );
end;

% output data
if( stop == 0 )
    % output velocity to ports
    block.OutputPort(1).Data = vx;
    block.OutputPort(2).Data = vy;
    block.OutputPort(3).Data = omega;
else
    % output zero velocity to ports
    block.OutputPort(1).Data = 0;
    block.OutputPort(2).Data = 0;
    block.OutputPort(3).Data = 0;
end;

block.OutputPort(1).Data = vx;
block.OutputPort(2).Data = vy;
block.OutputPort(3).Data = omega;

%endfunction

%//////////////////////////////////////////////////////////////////////////
function Derivatives(block)


%endfunction

%//////////////////////////////////////////////////////////////////////////
function Terminate(block)

% goodbye (debug) message
disp('Killing LineFollower...');

%endfunction
            
