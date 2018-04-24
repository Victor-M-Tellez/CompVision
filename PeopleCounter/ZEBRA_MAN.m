
pic0 = imread('a1.jpeg');
pic1 = imread('a2.jpeg');
pic2 = imread('a3.jpeg');
pic3 = imread('a4.jpeg');
pic5 = imread('a6.jpeg');

[x,y,z] = size(pic0);
gray0 = uint8(zeros(x,y));
gray1 = uint8(zeros(x,y));
gray2 = uint8(zeros(x,y));
gray3 = uint8(zeros(x,y));
gray5 = uint8(zeros(x,y));

Canvas = uint8(zeros(x,y));
threshholdScissor = 90;
N=2;
sigma=100;
ind = -floor(N/2) : floor(N/2);
sizeThreshold=9000;
expanderThreshold=10;
expanderStrength=12;
shrinkerThreshold=9000;
shrinkerStrength=8;
borderSize=25;

for i=1 : x
    for j=1 : y  
        gray0(i,j)= (.33*pic0(i,j,1)+.33*pic0(i,j,2)+.34*pic0(i,j,3));
        gray1(i,j)= (.33*pic1(i,j,1)+.33*pic1(i,j,2)+.34*pic1(i,j,3));
        gray2(i,j)= (.33*pic2(i,j,1)+.33*pic2(i,j,2)+.34*pic2(i,j,3));
        gray3(i,j)= (.33*pic3(i,j,1)+.33*pic3(i,j,2)+.34*pic3(i,j,3));
        gray5(i,j)= (.33*pic5(i,j,1)+.33*pic5(i,j,2)+.34*pic5(i,j,3));
    end
end


%
%Zebra1
%
background = MakeBackground(Canvas,gray0,gray1,gray2,gray3,gray5);


%
%Zebra2
%
%gray3 will be our Present pic
scissor= Scissors(Canvas,gray3,background,threshholdScissor);


%
%Zebra3
%
smooth = Smoothing(scissor,sigma,ind);


%
%Zebra4
%
sizeFiltered= FilterSize(smooth,sizeThreshold);


%
%Zebra5
%
expanded = ObjExpandFilter(sizeFiltered,expanderThreshold,expanderStrength);


%
%Zebra6
%
shriking = ObjShrinkingFilter(expanded,shrinkerThreshold,shrinkerStrength);


%
%Zebra7
%
Final = FrameMaker(shriking,borderSize);



