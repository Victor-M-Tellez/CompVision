%function for line
function [A] = Line(A, v1, v2)
    d=sqrt((v1-v2)*(v1-v2)');
    ui=(v2(1)-v1(1))/d;
    uj=(v2(2)-v1(2))/d;
    i=v1(1);
    j=v1(2);
  
    for K=0:round(d)
        i=i+ui;
        j=j+uj;
        ir=round(i);
        jr=round(j);
        if((ir>0)&&(jr>0) && (ir<256) && (jr<256))
            A(ir,jr)=255;       
        end
    end
 
 
end


