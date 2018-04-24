function [sizeFiltered] = FilterSize(Canvas,sizeThreshold)
[x,y]=size(Canvas); 

%SIZE FILTER
sizeFiltered=double(Canvas);
for i=4:x-3
    for j=4:y-3
         matrixTotal= double(Canvas(i-3,j-3))+double(Canvas(i-3,j-2))+double(Canvas(i-3,j-1))+double(Canvas(i-3,j)) +double(Canvas(i-3,j+1))+double(Canvas(i-3,j+2))+double(Canvas(i-3,j+3))+double(Canvas(i-2,j-3))+double(Canvas(i-2,j-2))+double(Canvas(i-2,j-1))+ double(Canvas(i-2,j)) +double(Canvas(i-2,j+1))+double(Canvas(i-2,j+2))+double(Canvas(i-1,j+3))+double(Canvas(i-1,j-3))+double(Canvas(i-1,j-2))+double(Canvas(i-1,j-1))+ double(Canvas(i-1,j)) +double(Canvas(i-1,j+1))+double(Canvas(i-1,j+2))+double(Canvas(i-1,j+3))+double(Canvas(i  ,j-3))+double(Canvas(i  ,j-2))+double(Canvas(i  ,j-1)) +double(Canvas(i,j))   +double(Canvas(i,j+1))+double(Canvas(i  ,j+2))+double(Canvas(i  ,j+3))+double(Canvas(i+1,j-3))+double(Canvas(i+1,j-2))+double(Canvas(i+1,j-1)) +double(Canvas(i+1,j)) +double(Canvas(i+1,j+1))+double(Canvas(i+1,j+2))+double(Canvas(i+1,j+3))+double(Canvas(i+2,j-3))+double(Canvas(i+2,j-2))+double(Canvas(i+2,j-1)) +double(Canvas(i+2,j)) +double(Canvas(i+2,j+1))+double(Canvas(i+2,j+2))+double(Canvas(i+2,j+3))+double(Canvas(i+3,j-3))+double(Canvas(i+3,j-2))+double(Canvas(i+3,j-1)) +double(Canvas(i+3,j)) +double(Canvas(i+3,j+1))+double(Canvas(i+3,j+2))+double(Canvas(i+3,j+3));
         if(matrixTotal<(sizeThreshold))
             sizeFiltered(i,j)=0;
        end
    end
end
imwrite(sizeFiltered,'Zebra4_filteredSize.tif','tiff');
