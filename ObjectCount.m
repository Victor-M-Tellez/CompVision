function [numbersFound, NumberOfObjects] = ObjectCount(B)
[m,n]=size(B);  
numbersFound=zeros(1,255);
for i=1:m
	for j=1:n
        if(B(i,j)>0)
        numbersFound(B(i,j))=1;
        end
    end
end

NumberOfObjects=0;
for j=1:255
    if(numbersFound(j)==1)
        fprintf('%i\n', j)
    end
    NumberOfObjects=NumberOfObjects+numbersFound(j);
end



end