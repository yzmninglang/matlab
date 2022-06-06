%% interp1
x=-1:0.1:1;
f=1./(1+9*x.^2);
xinter=-1:0.01:1;
finter=interp1(x,f,xinter);
figure
subplot(1,2,1);
plot(x,f);
hold on
scatter(x,f,'*');
subplot(1,2,2);
hold on
scatter(xinter,finter,'o');
plot(xinter,finter);

%% spline
x=-5:1:5;
y=1./(1+x.^2);
xi=-5:0.5:5;
yi=interp1(x,y,xi);
ys=spline(x,y,xi);
figure
plot(xi,yi);
hold on
scatter(x,y);
plot(xi,ys);

%%  temperate
t=0:2:24;
T=[12 9 9 10 18 24 28 27 25 20 18 15 13]
plot(t,T,'*');
ti=0:1/3600:24;
Tli=interp1(t,T,ti);
figure
plot(t,T,'*',ti,Tli,'r-');
T2i=interp1(t,T,ti,'spline');
plot(t,T,'*',ti,Tli,'r-',ti,T2i,'g-');

%% plane
figure
x=[0 4.74 9.05 19 38 57 76 95 114 133 152 171 190];
y=[0 5.23 8.1 11.97 16.15 17.1 16.34 14.63 12.16 9.69 7.03 3.99 0];
xi=[0:0.001:190];
yi=interp1(x,y,xi,'spline');
plot(xi,yi);


%% day
figure
day=[18 20 22 24 26 28 30 ];
dis=[9.9618 9.9544 9.9468 9.9391 9.9312 9.9232 9.9150];
days=18:0.0001:30;
diss=spline(day,dis,days );
plot(days,diss);








