pic1 = imread('binaryShapes.tif');
[m,n] =size(pic1);
%m = number of rows
%n = number of columns
n=n/4;% Because MATLAB treats the second dimention and 3rd dimention as one
% we divide the 3rd dimention out of this variable so we only have the 2nd
% dimention

B=zeros(m,n);% dummy clone to hold transformations we make to the original image
C=zeros(m,n,3);% dummy clone to hold transformations we make to the original image
f= zeros(1,255);% holder array to 

B=InvertImage(pic1,B);
%imwrite(B,'picB.tif','tiff');
[B,f] = AssingLabelsRound1(B,f);
B=AssingLabelsRound2(B,f);
[numbersFound, NumberOfObjects] = ObjectCount(B);

%Now we create an array to store the labels of the objects
labels=FindLabelsUsedInPic(NumberOfObjects,numbersFound);
C=ColorLabeledObjects(B,C,labels);
imwrite(C,'picC.jpeg','jpeg');









