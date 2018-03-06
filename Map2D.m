%function for rotation and translation
function [ v ] =Map2D( K,R,T,V1,Vi,p )
    P=K*[R T']*[Vi-V1 1]';
    w1=P(3,1);
    v(1)=256/2-P(1,1)/(w1*p);
    v(2)=256/2+P(2,1)/ (w1*p);
end

