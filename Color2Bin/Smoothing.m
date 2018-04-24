function [Canvas] = Smoothing(Canvas,sigma,ind)
[x,y]=size(Canvas);  
% GAUSSIAN GENERATOR 
%we will use this gaussian grid as a gaussian filter to smooth our image

[X,Y] = meshgrid(ind, ind);


% Create Gaussian Mask
gFilter = exp(-(X.^2 + Y.^2) / (2*sigma*sigma));

% Normalize so that total area (sum of all weights) is 1
gFilter = gFilter / sum( gFilter(:)  );


%filtered = scissor;

%Smoothing by Applying the gFilter
for i=2:x-1
    for j=2:y-1

	%PERFORM CONVOLUTION
    convolution =(Canvas(i-1,j-1)*gFilter(1,1))+(Canvas(i-1,j)*gFilter(1,2)) +(Canvas(i-1,j+1)*gFilter(1,3)) +(Canvas(i,j-1)*gFilter(2,1)) +(Canvas(i,j)*gFilter(2,2))+(Canvas(i,j+1)*gFilter(2,3))+(Canvas(i+1,j-1)*gFilter(3,1)) +(Canvas(i+1,j)*gFilter(3,2)) +(Canvas(i+1,j+1)*gFilter(3,3)) ; 
   
    Canvas(i,j)= convolution;
        
    end
end

imwrite(Canvas,'Zebra3_filteredPic.tif','tiff');