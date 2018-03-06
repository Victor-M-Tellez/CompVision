%define 8 points of the cube in world coordinate
picture_rangeX=300;
picture_rangeY=300;
controlY=0;
controlX=250;
height=20;
length=20;
x_min=30+controlX;
x_max=x_min+height;
y_min=30+controlY;
y_max=y_min+length;
fileName= "SQR";
 
for t=0:10:200
    A = zeros(picture_rangeX, picture_rangeY);
   
    x_min=30+controlX-t;
    y_min=30+controlY+t;
    x_max=x_min+height;
    y_max=y_min+length;





    A = Square_Drawer(A, x_min, x_max , y_min , y_max);
 
    A=mat2gray(A);
    imshow(A);
    if(t== 0)imwrite(A,'SQR00.tif','tiff');
    end
    if(t== 10)imwrite(A,'SQR01.tif','tiff');
    end
    if(t== 20)imwrite(A,'SQR02.tif','tiff');
    end
    if(t== 30) imwrite(A,'SQR03.tif','tiff');
    end
    if(t== 40)imwrite(A,'SQR04.tif','tiff');
    end
    if(t== 50)imwrite(A,'SQR05.tif','tiff');
    end
    if(t== 60)imwrite(A,'SQR06.tif','tiff');
    end
    if(t== 70)imwrite(A,'SQR07.tif','tiff');
    end
    if(t== 80)imwrite(A,'SQR08.tif','tiff');
    end
    if(t== 90)imwrite(A,'SQR09.tif','tiff');
    end
     if(t== 100)imwrite(A,'SQR10.tif','tiff');
    end
    if(t== 110)imwrite(A,'SQR11.tif','tiff');
    end
    if(t== 120)imwrite(A,'SQR12.tif','tiff');
    end
    if(t== 130)imwrite(A,'SQR13.tif','tiff');
    end
    if(t== 140)imwrite(A,'SQR14.tif','tiff');
    end
    if(t== 150)imwrite(A,'SQR15.tif','tiff');
    end
    if(t== 160)imwrite(A,'SQR16.tif','tiff');
    end
    if(t== 170)imwrite(A,'SQR17.tif','tiff');
    end
    if(t== 180)imwrite(A,'SQR18.tif','tiff');
    end
    if(t== 190)imwrite(A,'SQR19.tif','tiff');
    end
   % pause
    
end


