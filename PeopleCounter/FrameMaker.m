function [Canvas] = FrameMaker(Canvas,borderSize)
[x,y]=size(Canvas); 


for i=1:x
    for j=1:y
     
        if(i<borderSize)
             Canvas(i,j)=0;
        end
        if(j<borderSize)
             Canvas(i,j)=0;
        end
        if(i>(x-borderSize))
             Canvas(i,j)=0;
        end
        if(j>(y-borderSize))
             Canvas(i,j)=0;
        end
    end
end
imwrite(Canvas,'Zebra7_Frame.tif','tiff');