%% lsqcurvefit
xdata=0:0.1:1;
ydata=[3.1,3.27,3.81,4.5,5.18,6,7.05,8.56,9.69,11.25,13.17];
x0=[0,0,0];
f=@(x,xdata) x(1)*exp(xdata)+x(2)*xdata.^2+x(3)*xdata.^3;
[x,resnorm]=lsqcurvefit(f,x0,xdata,ydata);
xdata1=0:0.01:1;
figure;
plot(xdata1,f(x,xdata1));
hold on
scatter(xdata,ydata);


%% example2  polyfit
xdata=0:0.1:1;
ydata=[3.1,3.27,3.81,4.5,5.18,6,7.05,8.56,9.69,11.25,13.17];
p=polyfit(xdata,ydata,3);
x=0:0.01:1;
figure;
hold on
plot(x,polyval(p,x));
scatter(xdata,ydata);

%% example3 lsqcurvefit
xdata=[1.6 2.7 1.3 4.1 3.6 2.3 0.6 4.9 3 2.4];
ydata=[17.7 49 13.1 189.4 110.8 34.5 4 409.1 65 36.9];
f=@(x,xdata) x(1)*exp(xdata)+x(2)*sin(xdata)+x(3)*log(xdata);
x0=[0 0 0];
[x resnorm]=lsqcurvefit(f,x0,xdata,ydata);
xdata1=0:0.05:5;
plot(xdata1,f(x,xdata1));
hold on
scatter(xdata,ydata);




