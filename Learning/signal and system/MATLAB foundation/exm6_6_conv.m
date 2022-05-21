%离散卷积计算x(n)=u(n)-u(n-10)与h（n）=u（n）-u(n-5)


%创建x(n)
nx=0:9;
x=ones(1,length(nx));


%创建h(n)
nh=0:4;
h=ones(1,length(nh));


%卷积
y=conv(x,h);


%确定下限
ny_min=min(nx)+min(nh);

%确定上限
ny_max=max(nh)+max(nx);

%确定y的时间范围
ny=ny_min:ny_max;

subplot(3,1,1);
stem(nx,x);
title('u(n)-u(n-10)')

subplot(3,1,2);
stem(nh,h);
title('u（n）-u(n-5)');
axis([min(nh)-1 max(nh)+1 0 max(h)+1])

%画出卷积的图形
subplot(3,1,3);
stem(ny,y);
title('x(n)*h(n)');
