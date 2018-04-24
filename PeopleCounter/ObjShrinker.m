function [shriking] = ObjShrinker(Canvas,shrinkerThreshold)
[x,y]=size(Canvas); 

shriking=Canvas;

for i=4:x-3
    for j=4:y-3
      
         matrixtotal= double(Canvas(i-3,j-3))+double(Canvas(i-3,j-2))+double(Canvas(i-3,j-1))+double( Canvas(i-3,j)) +double(Canvas(i-3,j+1))+double(Canvas(i-3,j+2))+double(Canvas(i-3,j+3))+double(Canvas(i-2,j-3))+double(Canvas(i-2,j-2))+double(Canvas(i-2,j-1))+ double(Canvas(i-2,j)) +double(Canvas(i-2,j+1))+double(Canvas(i-2,j+2))+double(Canvas(i-1,j+3))+double(Canvas(i-1,j-3))+double(Canvas(i-1,j-2))+double(Canvas(i-1,j-1))+ double(Canvas(i-1,j)) +double(Canvas(i-1,j+1))+double(Canvas(i-1,j+2))+double(Canvas(i-1,j+3))+double(Canvas(i  ,j-3))+double(Canvas(i  ,j-2))+double(Canvas(i  ,j-1)) +double(Canvas(i,j))   +double(Canvas(i,j+1))+double(Canvas(i  ,j+2))+double(Canvas(i  ,j+3))+double(Canvas(i+1,j-3))+double(Canvas(i+1,j-2))+double(Canvas(i+1,j-1)) +double(Canvas(i+1,j)) +double(Canvas(i+1,j+1))+double(Canvas(i+1,j+2))+double(Canvas(i+1,j+3))+double(Canvas(i+2,j-3))+double(Canvas(i+2,j-2))+double(Canvas(i+2,j-1)) +double(Canvas(i+2,j)) +double(Canvas(i+2,j+1))+double(Canvas(i+2,j+2))+double(Canvas(i+2,j+3))+double(Canvas(i+3,j-3))+double(Canvas(i+3,j-2))+double(Canvas(i+3,j-1)) +double(Canvas(i+3,j)) +double(Canvas(i+3,j+1))+double(Canvas(i+3,j+2))+double(Canvas(i+3,j+3));
         
         if(matrixtotal<shrinkerThreshold)
             shriking(i,j)=0;
        end
    end
end


