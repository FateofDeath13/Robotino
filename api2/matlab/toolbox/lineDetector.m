% Returns the x-position of a line.
% The input image must be a true color image.
% The line must be located in the last 20 rows of the input image.
% Call: [posx] = lineDetector( img, threshold )
% Example: posx = lineDetector( img, 100 )
function [posx] = lineDetector( img, threshold )

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
% output
posx = ceil(sum/4);

% DEBUG / SHOW DETECTED LINE:
% For a b/w picture of the result copy bw to all three color channels
% of a 20xnx3-matrix and show it with the 'image'-command of MATLAB.
bw3 = zeros(20,n,3);
bw3(:,:,1) = bw(:,:);
bw3(:,:,2) = bw(:,:);
bw3(:,:,3) = bw(:,:);
image( uint8( bw3 ) );
            
