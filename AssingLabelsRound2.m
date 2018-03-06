function [B] = AssingLabelsRound2(B,f)
[m,n]=size(B);  

for i=1:m
	for j=1:n
		if(B(i,j)>0)
			k = B(i,j);
			while(f(k)>0)
				k=f(k);
			end
			B(i,j)=k;
		end
	end
end

while(j==k)
	while(f(j)>0)
		j=f(j);
	end
	while(f(k)>0)
		k=f(k);
	end
	if(j~=k)		
		f(j)=k
	end
end


end