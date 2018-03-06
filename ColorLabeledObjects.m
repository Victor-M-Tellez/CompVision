%function for line
function [C] = ColorLabeledObjects(B, C, labels)
[m,n]=size(B);    
for i=1:m
	for j=1:n
        if(B(i,j)==labels(1))
            C(i,j,1)= 1;
            C(i,j,2)= 1;
            C(i,j,3)= 0;
        end
        if(B(i,j)==labels(2))
            C(i,j,1)= 1;
            C(i,j,2)= 0;
            C(i,j,3)= 1;
        end
        if(B(i,j)==labels(3))
            C(i,j,1)= 0;
            C(i,j,2)= 1;
            C(i,j,3)= 1;
        end
        if(B(i,j)==labels(4))
            C(i,j,1)= 1;
            C(i,j,2)= 0;
            C(i,j,3)= 0;
        end
        if(B(i,j)==labels(5))
            C(i,j,1)= 0;
            C(i,j,2)= 1;
            C(i,j,3)= 0;
        end
        if(B(i,j)==labels(6))
            C(i,j,1)= 0;
            C(i,j,2)= 0;
            C(i,j,3)= 1;
        end

        
    end
end
 
end