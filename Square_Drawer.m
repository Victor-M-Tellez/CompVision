%function for line
function [A] = Square_Drawer(A, x_min, x_max, y_min, y_max)
    [x_end, y_end]= size(A);
    for y=0:y_end
        for x=0:x_end
            if(x>x_min &&x<x_max &&y>y_min && y<y_max)
                A(x,y)=255;       
            end
        
        end
        
    end
 
 
 
end