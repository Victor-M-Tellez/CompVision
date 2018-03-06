%define 8 points of the cube in world coordinate
V1=[-50,-50,200];
V2=[-50,-45,200];
V3=[-45,-45,200];
V4=[-45,-50,200];
V5=[-45,-50,205];
V6=[-50,-45,205];
V7=[-50,-50,205];
V8=[-45,-45,205];
 
%set given values
f=30;
velocity=[2 3 4];
K=[f 0 0;
    0 f 0;
    0 0 1];
theta0=0;
d=sqrt((V8-V1)*(V8-V1)');
n=(V8-V1)/d;%axis unit vector
N=[0 -n(3) n(2)
   n(3) 0 -n(1)
   -n(2) n(1) 0];%eq.32
w0=10;%deg/sec
T0=[-20 -20 500];
p=0.01;%pixel size(mm)
 
for t=0:0.2:14
    theta=theta0+w0*t;
    T=T0+ velocity*t;
    R=eye(3,3)+sind(theta)*N+(1-cosd(theta))*N*N;
 
    v1=Map2D(K,R,T,V1,V1,p);
    v2=Map2D(K,R,T,V1,V2,p);
    v3=Map2D(K,R,T,V1,V3,p);
    v4=Map2D(K,R,T,V1,V4,p);
    v5=Map2D(K,R,T,V1,V5,p);
    v6=Map2D(K,R,T,V1,V6,p);
    v7=Map2D(K,R,T,V1,V7,p);
    v8=Map2D(K,R,T,V1,V8,p);
 
    A = zeros(256, 256);
    A = Line(A, v1,v2);
    A = Line(A, v2,v3);
    A = Line(A, v3,v4);
    A = Line(A, v4,v1);
    A = Line(A, v7,v6);
    A = Line(A, v6,v8);
    A = Line(A, v8,v5);
    A = Line(A, v5,v7);
    A = Line(A, v1,v7);
    A = Line(A, v2,v6);
    A = Line(A, v3,v8);
    A = Line(A, v4,v5);
 
    A=mat2gray(A);
    imshow(A);
   % pause
    
end
