pic1  = imread('a2.jpeg');
 
[x,y,z] = size(pic1);
pic1g=uint8(zeros(x,y));


%TURN THE IMAGE TO GRAYSCALE FROM RBG
for i=1 : x
    for j=1 : y  
        r= pic1(i,j,1);
        b= pic1(i,j,2);
        g= pic1(i,j,3);
        pixel = uint8((.33*r+.33*b+.34*g));
        pic1g(i,j)= pixel;
    end
end
imwrite(pic1g,'pic1g.tif','tiff')

pic2  = imread('a3.jpeg');
 
[x,y,z] = size(pic2);
pic2g=uint8(zeros(x,y));


%TURN THE IMAGE TO GRAYSCALE FROM RBG
for i=1 : x
    for j=1 : y  
        r= pic2(i,j,1);
        b= pic2(i,j,2);
        g= pic2(i,j,3);
        pixel = uint8((.33*r+.33*b+.34*g));
        pic2g(i,j)= pixel;
    end
end
imwrite(pic2g,'pic2g.tif','tiff')



pic3g=uint8(zeros(x,y));

for i=1 : x
    for j=1 : y  
        pic3g(i,j)= pic2g(i,j)-pic1g(i,j);
    end
end
imwrite(pic3g,'pic3g.tif','tiff')






