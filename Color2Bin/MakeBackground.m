function [BG] = MakeBackground(BG,gray0,gray1,gray2,gray3,gray4)
%(BG is the background, length of BG, height of BG, pic1,pic2,...,pici)
[x,y]=size(BG); 
for i=1 : x
    for j=1 : y  
        all= [BG(i,j) gray0(i,j) gray1(i,j) gray2(i,j) gray3(i,j) gray4(i,j)];
        BG(i,j)= mode(all);
    end
end

imwrite(BG,'Zebra1_background.tif','tiff');