function [B,f] = AssingLabelsRound1(B,f)
[m,n]=size(B);    
l=2;
    for i =2:m-1
	for j = 2:n-1
		if(B(i,j)==255)
			a = B(i,j);
			b= B(i,j-1);
			c=B(i-1,j);
			if((b==0)&(c==0))
				B(i,j)=l;
				l=l+1;
            elseif((b==0)&(c>1))
				B(i,j)=c;
            elseif((b>1)&(c==0))
				B(i,j)=b;
            elseif((b>1)&(c>1))
				if(b==c)
				
                    B(i,j)=b;
				else
					while(f(b)>0)
						b=f(b);%find root
					end
					while(f(c)>0)
						c=f(c);%find root
					end
					if(b==c)
						B(i,j)=b;
					else
						if(b<c)
							B(i,j)=b;
							f(c)=b;
						else
							B(i,j)=c;
							f(b)=c;
						end
					end
				end
			end
		end
	end
end


end