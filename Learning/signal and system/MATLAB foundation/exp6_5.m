%离散卷积练习6-5

%信号u(n)-u(n-4)
nx=0:3;
x=ones(1,length(nx));


%卷积信号
ny=2*min(nx):2*max(nx);
y=conv(x,x);


subplot(2,1,1);
stem(nx,x);
axis([min(nx)-1 max(nx)+1 0 max(x)]);


%绘制卷积信号
subplot(2,1,2);
stem(ny,y);

