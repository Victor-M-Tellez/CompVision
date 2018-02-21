%pic1 = imread('a1.jpeg');
%[x,y,z] = size(pic1);
%pic1g = uint8(zeros(x,y);
%
pic0 = imread('a1.jpeg');
pic1 = imread('a2.jpeg');
pic2 = imread('a3.jpeg');
pic3 = imread('a4.jpeg');
%pic4 = imread('a5.jpeg');
pic5 = imread('a6.jpeg');
%pic6 = imread('a7.jpeg');
%pic7 = imread('a8.jpeg');
%pic8 = imread('a9.jpeg');
%pic9 = imread('a99.jpeg');
[x,y,z] = size(pic0);
gray0 = uint8(zeros(x,y));
gray1 = uint8(zeros(x,y));
gray2 = uint8(zeros(x,y));
gray3 = uint8(zeros(x,y));
%gray4 = uint8(zeros(x,y));
gray5 = uint8(zeros(x,y));
%gray6 = uint8(zeros(x,y));
%gray7 = uint8(zeros(x,y));
%gray8 = uint8(zeros(x,y));
%gray9 = uint8(zeros(x,y));

for i=1 : x
    for j=1 : y  
        gray0(i,j)= (.33*pic0(i,j,1)+.33*pic0(i,j,2)+.34*pic0(i,j,3));
        gray1(i,j)= (.33*pic1(i,j,1)+.33*pic1(i,j,2)+.34*pic1(i,j,3));
        gray2(i,j)= (.33*pic2(i,j,1)+.33*pic2(i,j,2)+.34*pic2(i,j,3));
        gray3(i,j)= (.33*pic3(i,j,1)+.33*pic3(i,j,2)+.34*pic3(i,j,3));
        %gray4(i,j)= (.33*pic4(i,j,1)+.33*pic4(i,j,2)+.34*pic4(i,j,3));
        gray5(i,j)= (.33*pic5(i,j,1)+.33*pic5(i,j,2)+.34*pic5(i,j,3));
        %gray6(i,j)= (.33*pic6(i,j,1)+.33*pic6(i,j,2)+.34*pic6(i,j,3));
        %gray7(i,j)= (.33*pic7(i,j,1)+.33*pic7(i,j,2)+.34*pic7(i,j,3));
        %gray8(i,j)= (.33*pic8(i,j,1)+.33*pic8(i,j,2)+.34*pic8(i,j,3));
        %gray9(i,j)= (.33*pic9(i,j,1)+.33*pic9(i,j,2)+.34*pic9(i,j,3));
    end
end
imwrite(gray0,'gray0.tif','tiff');
imwrite(gray1,'gray1.tif','tiff');
imwrite(gray2,'gray2.tif','tiff');
imwrite(gray3,'gray3.tif','tiff');
%imwrite(gray4,'gray4.tif','tiff');
imwrite(gray5,'gray5.tif','tiff');
%imwrite(gray6,'gray6.tif','tiff');
%imwrite(gray7,'gray7.tif','tiff');
%imwrite(gray8,'gray8.tif','tiff');
%imwrite(gray9,'gray9.tif','tiff');

%
%Zebra1
%


background = uint8(zeros(x,y));


for i=1 : x
    for j=1 : y  
        
        all= [background(i,j) gray0(i,j) gray1(i,j) gray2(i,j) gray3(i,j) gray5(i,j)];
        background(i,j)= mode(all);
    end
end

imwrite(background,'background.tif','tiff');




scissor=uint8(zeros(x,y));

for i=1 : x
    for j=1 : y  
        hold= gray3(i,j)-background(i,j);
        
        if(hold>90)
            scissor(i,j)=200;
        end
        
    end
end
imwrite(scissor,'Ascissor.tif','tiff')



% GAUSSIAN GENERATOR 
%we will use this gaussian grid as a gaussian filter to smooth our image
N=2;
sigma=100;
ind = -floor(N/2) : floor(N/2);
[X Y] = meshgrid(ind, ind);
% Create Gaussian Mask
gFilter = exp(-(X.^2 + Y.^2) / (2*sigma*sigma));
% Normalize so that total area (sum of all weights) is 1
gFilter = gFilter / sum(gFilter(:));

filtered = scissor;

%Smoothing by Applying the gFilter
for i=2:x-1
    for j=2:y-1
    convolution =(filtered(i-1,j-1)*gFilter(1,1))+(filtered(i-1,j)*gFilter(1,2)) +(filtered(i-1,j+1)*gFilter(1,3)) +(filtered(i,j-1)*gFilter(2,1)) +(filtered(i,j)*gFilter(2,2))+(filtered(i,j+1)*gFilter(2,3))+(filtered(i+1,j-1)*gFilter(3,1)) +(filtered(i+1,j)*gFilter(3,2)) +(filtered(i+1,j+1)*gFilter(3,3)) ; 
   
    filtered(i,j)= convolution;
        
    end
end

imwrite(filtered,'z3filteredPic.tif','tiff');


%SIZE FILTER
%

sizeFiltered=double(filtered);
for i=4:x-3
    for j=4:y-3
        %convolution =(filtered(i-1,j-1)*gFilter(1,1))+(filtered(i-1,j)*gFilter(1,2)) +(filtered(i-1,j+1)*gFilter(1,3)) +(filtered(i,j-1)*gFilter(2,1)) +(filtered(i,j)*gFilter(2,2))+(filtered(i,j+1)*gFilter(2,3))+(filtered(i+1,j-1)*gFilter(3,1)) +(filtered(i+1,j)*gFilter(3,2)) +(filtered(i+1,j+1)*gFilter(3,3)) ; 
        %filtered(i,j)= convolution;
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         %sizeFiltered(i,j)= matrixtotal;
         if(matrixtotal<(9000))
             sizeFiltered(i,j)=0;
        end
    end
end
imwrite(sizeFiltered,'z4filteredSize.tif','tiff');


%
%Expanding and shriking contractions
%
filtered = sizeFiltered;
expansion=double(sizeFiltered);
for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal>10)
             expansion(i,j)=190;
        end
    end
end
filtered=expansion;

for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal>10)
             expansion(i,j)=190;
        end
    end
end
filtered=expansion;

for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal>10)
             expansion(i,j)=190;
        end
    end
end
filtered=expansion;

for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal>10)
             expansion(i,j)=190;
        end
    end
end
filtered=expansion;

for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal>10)
             expansion(i,j)=190;
        end
    end
end
filtered=expansion;

for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal>10)
             expansion(i,j)=190;
        end
    end
end
filtered=expansion;

for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal>10)
             expansion(i,j)=190;
        end
    end
end
filtered=expansion;

for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal>10)
             expansion(i,j)=190;
        end
    end
end
filtered=expansion;

for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal>10)
             expansion(i,j)=190;
        end
    end
end

filtered=expansion;

for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal>10)
             expansion(i,j)=190;
        end
    end
end

filtered=expansion;

for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal>10)
             expansion(i,j)=190;
        end
    end
end
filtered=expansion;

for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal>10)
             expansion(i,j)=190;
        end
    end
end
imwrite(expansion,'z5Expansion.tif','tiff');



filtered=expansion;
shriking= filtered;
for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal<9000)
             shriking(i,j)=0;
        end
    end
end
filtered=shriking;
for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal<9000)
             shriking(i,j)=0;
        end
    end
end
filtered=shriking;
for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal<9000)
             shriking(i,j)=0;
        end
    end
end

filtered=shriking;
for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal<9000)
             shriking(i,j)=0;
        end
    end
end

filtered=shriking;
for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal<9000)
             shriking(i,j)=0;
        end
    end
end
filtered=shriking;
for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal<9000)
             shriking(i,j)=0;
        end
    end
end
filtered=shriking;
for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal<9000)
             shriking(i,j)=0;
        end
    end
end
filtered=shriking;
for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(filtered(i-3,j-3))+double(filtered(i-3,j-2))+double(filtered(i-3,j-1))+double( filtered(i-3,j)) +double(filtered(i-3,j+1))+double(filtered(i-3,j+2))+double(filtered(i-3,j+3))+double(filtered(i-2,j-3))+double(filtered(i-2,j-2))+double(filtered(i-2,j-1))+ double(filtered(i-2,j)) +double(filtered(i-2,j+1))+double(filtered(i-2,j+2))+double(filtered(i-1,j+3))+double(filtered(i-1,j-3))+double(filtered(i-1,j-2))+double(filtered(i-1,j-1))+ double(filtered(i-1,j)) +double(filtered(i-1,j+1))+double(filtered(i-1,j+2))+double(filtered(i-1,j+3))+double(filtered(i  ,j-3))+double(filtered(i  ,j-2))+double(filtered(i  ,j-1)) +double(filtered(i,j))   +double(filtered(i,j+1))+double(filtered(i  ,j+2))+double(filtered(i  ,j+3))+double(filtered(i+1,j-3))+double(filtered(i+1,j-2))+double(filtered(i+1,j-1)) +double(filtered(i+1,j)) +double(filtered(i+1,j+1))+double(filtered(i+1,j+2))+double(filtered(i+1,j+3))+double(filtered(i+2,j-3))+double(filtered(i+2,j-2))+double(filtered(i+2,j-1)) +double(filtered(i+2,j)) +double(filtered(i+2,j+1))+double(filtered(i+2,j+2))+double(filtered(i+2,j+3))+double(filtered(i+3,j-3))+double(filtered(i+3,j-2))+double(filtered(i+3,j-1)) +double(filtered(i+3,j)) +double(filtered(i+3,j+1))+double(filtered(i+3,j+2))+double(filtered(i+3,j+3));
         
         if(matrixtotal<9000)
             shriking(i,j)=0;
        end
    end
end
imwrite(shriking,'z6Shrink.tif','tiff');

