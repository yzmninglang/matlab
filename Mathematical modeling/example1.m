t=[0 1 2 3 4 5 6 7 8 9 10 11 12 13 14 15 16];
y=[30 29.1 28.4 28.1 28.0 27.7 27.5 27.2 27 26.8 26.5 26.3 26.1 25.7 25.3 24.8 24.0];
scatter(t,y);
p=polyfit(t,y,1);
x=[0:16];
hold on
yfit=polyval(p,x);
plot(x,yfit,'r');

%% expfit
x0=[500e-6 1000e-6 1500e-6 2000e-6 2375e-6];
y=[3.103e3 2.465e3 1.953e3 1.517e3 1.219e3];
z0=[1.55 2.47 2.93 3.03 2.89];
p=polyfit(x0,log(y),1 );
syms x 
z=x*exp(p(2)+p(1)*x);
t=linspace(500e-6,3000e-6,1000);
yfit=subs(z,x,t);
plot(t,yfit);
hold on 
plot(x0,z0,'or')

%% 
x=-2:0.4:2;
y=exp(-x.^2);
xs=-2:0.01:2;
ys=spline(x,y,xs);
yi=interp1(x,y,xs)
hold on
scatter(x,y);
plot(xs,yi);
plot(xs,ys);
axis square

%% medican
figure
t=[0.25 0.5 1 1.5 2 3 4 6 8];
c=[19.2 18.15 15.36 14.10 12.89 9.32 7.45 5.24 3.01];
scatter(t,c);
%scatter(t,log(c))


%% linprog
A=[1 1;1 1/4; 1 -1 ;-1/4 -1 ;-1 -1;-1 1];
b=[2 1 2 1 -1 2];
Aeq=[1 1/4];
beq=1/2;
f=[-1 -1/3];
xl=[-1 -0.5];
xu=[1.5 1.25];
options=optimoptions('linprog','algorithm','dual-simplex');
x=linprog(f,A,b,Aeq,beq,xl,xu,options);






