clear,clc
zhunzhongli1=[];
cd=[0.078 0.105 0.12 0.15 0.18];%????
zl=[3.2,7,12.5,19.5,28.12];%????????
m=[1000 10 10 10 10 100];
mm1=1200;%??????
for j=1:(22.05/0.105)
    m1=7*0.105;
    m=[m,m1];
end
l=[1,1,1,1,1];
for jj=1:(22.05/0.105)
l=[l,0.105];
end
g=9.80665;
for i=1:length(m)
    if i==1
        zhunzhongli=m(i)*g;
        zhunzhongli1=[zhunzhongli1,zhunzhongli];
    elseif i<=5&&i>=2
        v1=0.025^2*pi*1;%????
        zhunzhongli=-1025*g*v1+m(i)*g;%????? g=9.8
        zhunzhongli1=[zhunzhongli1,zhunzhongli];
    elseif i==6
        v2=0.15^2*pi*1;
        zhunzhongli=-1025*g*v2+m(i)*g;
        zhunzhongli1=[zhunzhongli1,zhunzhongli];
    elseif i>=7
        zl=7*0.105;
        v3=zl./7850;
        zhunzhongli=-1025*g*v3+m(i)*g;
        zhunzhongli1=[zhunzhongli1,zhunzhongli];
     end
end
theta=[];
theta3={};
k=1;
phy1={};
v=36;
ro=1025;
ii=1000/(ro*pi);
wz=[];
aa2={};
fx=[];
fy=[];
h2=[];
t1=[];
T1=[];
theta1=[];
theta=[];
flll={};
fyy=[];
h3=[0.3:0.0001:0.8];
for h=h3
    phy=zeros(1,215);
    fyy=[];
    aa1=[];
    h1=[];
    h2={};
    fuli=ffuli(g,h);
    fengli=ffengli(v,h);%v ???
    fx(1)=fengli;
    fy(1)=fuli-zhunzhongli1(1);
    phy(1)=atan(((2*fy(1))-zhunzhongli1(2))/fx(1)/2);
    for j=2:215
        if j==6
             vz=mm1/7085;
            fll=-1025*vz*g+mm1*g;
            fy(6)=fy(5)-zhunzhongli1(5)-fll;
            fx(6)=fx(5);
            phy(j)=atan(((2*fy(j-1))-zhunzhongli1(j))/(fx(j-1)*2));
    else
            fy(j)=fy(j-1)-zhunzhongli1(j);%???????????? 1
            fx(j)=fx(j-1);
            phy(j)=atan(((2*fy(j-1))-zhunzhongli1(j))/(fx(j-1)*2));
end
if fy(j)<0
break
end
end
flll{k}=fy;
phy1{k}=phy;
h1=sin(phy).*l
H(k)=sum(h1)+h;
k=k+1;
phy=[];
end
[h_min,u]=min(abs(18-H(:)))
cshd=0.3+u*0.0001;
jd=phy1{u};
yy=0;
xx=0;
xx1=[];
yy1=[];
yfx=sin(phy1{u}).*l;
xfx=cos(phy1{u}).*l;
for i=length(yfx):-1:6
yy=yy+yfx(i);
yy1=[yy1,yy];
xx=xx+xfx(i);
 xx1=[xx1,xx];
end
plot(xx1,yy1)
xlabel('x ?')
ylabel('y ?')
title('?? 36m/s ?????')
R=sum(cos(jd).*l);
function [fengli] = ffengli( v,h )
s=(2-h)*2;
fengli=0.625*s*v.*v;
end
function [ fuli ro ] = ffuli(g,h )
ro=1025;
r=1;
vpai=pi*r*r*h;
fuli=ro*g*vpai;
