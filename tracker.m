pic  = imread('office.jpeg');
 
[x,y,z] = size(pic);
pic2gray=uint8(zeros(x,y));
%h[k]  is the histogram array for k=0,1,2,…,255, 
h= zeros(1,256) ;
%then the discrete probability for brightness k is p[k]=h[k]/(M*N). 
p=zeros(1,255);
%c[k] is the sum of all p  from p[0] to p[k]
c=zeros(1,255);
%J[m,n] = 255*c{pic1[m,n]}
J=uint8(zeros(x,y));


%TURN THE IMAGE TO GRAYSCALE FROM RBG
for i=1 : x
    for j=1 : y  
        r= pic(i,j,1);
        b= pic(i,j,2);
        g= pic(i,j,3);
        pixel = uint8((.33*r+.33*b+.34*g));
        pic2gray(i,j)= pixel;
        h(1, pixel+1 ) = h(1,pixel+1)+1;
    end
end
imwrite(pic2gray,'z1pic2Gray.tif','tiff')

%then the discrete probability for brightness k is p[k]=h[k]/(M*N). 
for a=1:255
     p(a)=h(a)/(x*y);
end

%c[k] is the sum of all p  from p[0] to p[k]
for ck=1:255
    for pk=1:255
        if(pk<=ck)
            c(ck)=c(ck)+p(pk);
        end
    end
end


%J is the HISTOGRAM EQUALIZED IMAGE
%J[m,n] = 255*c{pic1[m,n]}
%Histogram Equalization: Transforming the input image so that 
%the output image has an "equalized" histogram. 
%Using the Cumulative Distribution Function (CDF) of the histogram of the input
%image as the intensity transformation function.

for m=1 : x
    for n=1 : y  
        J(m,n)=255*c(pic2gray(m,n)+1);
    end
end

imwrite(J,'z2pic2GrayOptimized.tif','tiff')



% GAUSSIAN GENERATOR 
%we will use this gaussian grid as a gaussian filter to smooth our image
N=2;
sigma=10;
ind = -floor(N/2) : floor(N/2);
[X Y] = meshgrid(ind, ind);
% Create Gaussian Mask
gFilter = exp(-(X.^2 + Y.^2) / (2*sigma*sigma));
% Normalize so that total area (sum of all weights) is 1
gFilter = gFilter / sum(gFilter(:));

filtered = J;

%Smoothing by Applying the gFilter
for i=2:x-1
    for j=2:y-1
    convolution =(filtered(i-1,j-1)*gFilter(1,1))+(filtered(i-1,j)*gFilter(1,2)) +(filtered(i-1,j+1)*gFilter(1,3)) +(filtered(i,j-1)*gFilter(2,1)) +(filtered(i,j)*gFilter(2,2))+(filtered(i,j+1)*gFilter(2,3))+(filtered(i+1,j-1)*gFilter(3,1)) +(filtered(i+1,j)*gFilter(3,2)) +(filtered(i+1,j+1)*gFilter(3,3)) ; 
   
    filtered(i,j)= convolution;
        
    end
end

imwrite(filtered,'z3filteredPic.tif','tiff');


%In order to estimate the gradient magnitude and the 
%direction at a specific pixel f(i,j).
%the gradient vector at pixel f(i,j) is made up of 
%a horizontal and vertical component Gradient vector: (fx,fy)
%where	fx = f(i+1,j)-f(i,j) 
%and 	fy = f(i,j+1) - f(i,j)

%The gradient Magnitude is 
%Gradient magnitude = sqrt(  (fx)^2 + (fy)^2)

%The gradient direction can be calculated by 
%atan(fy/fx) radians
gradientMag= zeros(x,y);
gradientDir = zeros(x,y);
fx=0;
fy=0;
%Sector1= angles 0 to  44 and their opposite angles 180 degrees off. 
%Sector1= angles 45 to 89, and their opposite angles 180 degrees off. 
%Sector3 = angles 90 to 134 and their opposite angles 180 degrees off. 
%Sector4 = angles 135 to 179 and their opposite angles 180 degrees off. 
Tavg=0;
count=0;
for i=2:x-1
    for j=2:y-1
        fx=im2double(filtered(i+1,j)-filtered(i,j));
        fy=im2double(filtered(i,j+1)-filtered(i,j));
        gradientMag(i,j)=100*sqrt((fx)^2 + (fy)^2);
        gradientDir(i,j)= abs(radtodeg(atan(fy/fx)));
        
        
       Tavg = Tavg+ gradientMag(i,j);
       count = count+ 1;
        
        
    end
end

Tavg= Tavg/count;


Thigh=0;
Tlow=0;
countHigh=0;
countLow=0;

for i=3:x-2
    for j=3:y-2
      if(gradientMag(i,j)>Tavg)
          Thigh =+ gradientMag(i,j);
          countHigh =+ 1;
      else
          Tlow =+ gradientMag(i,j);
          countLow =+ 1;
      end
        
    end
end

Thigh = Thigh/countHigh;
Tlow = Tlow/countLow;

for i=2:x-1
    for j=2:y-1
       if(gradientMag(i,j)<2)
       filtered(i,j)=0;
       end
       
    end
end
imwrite(filtered,'z4ThresholdPicB.tif','tiff');


















