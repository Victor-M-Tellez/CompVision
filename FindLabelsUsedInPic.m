function [labels] = FindLabelsUsedInPic(NumberOfObjects,numbersFound)

labels=zeros(1,NumberOfObjects);
x=1;
for j=1:255
    if(numbersFound(j)==1)
        labels(1,x)=j;
        x=x+1;
    end
end



end