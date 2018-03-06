pic1 = imread('binaryShapes.tif');
[m,n] =size(pic1);
n=n/4;
B=zeros(m,n);
C=zeros(m,n,3);
f= zeros(1,255);

B=InvertImage(pic1,B);
%imwrite(B,'picB.tif','tiff');
[B,f] = AssingLabelsRound1(B,f);
B=AssingLabelsRound2(B,f);
[numbersFound, NumberOfObjects] = ObjectCount(B);

%Now we create an array to store the labels of the objects
labels=FindLabelsUsedInPic(NumberOfObjects,numbersFound);
C=ColorLabeledObjects(B,C,labels);
imwrite(C,'picC.jpeg','jpeg');









