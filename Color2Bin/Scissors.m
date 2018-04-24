function [Canvas] = Scissors(Canvas,Present,Background,threshold)
%(Canvas Matrix to paste Cut objects into, length of Blank, height of Blank, pici)
[x,y]=size(Canvas); 
for i=1 : x
    for j=1 : y  
        
        if((Present(i,j)-Background(i,j))>threshold)%threshold 
            	Canvas(i,j)=200;
        end
        
    end
end
imwrite(Canvas,'Zebra2_Ascissor.tif','tiff')

