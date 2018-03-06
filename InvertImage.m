function [B] = InvertImage(pic1, B)
[m,n]=size(B);    
for i =1:m
	for j = 1:n
        if(pic1(i,j)==0)
        B(i,j)=255;
        end
    end
end
end