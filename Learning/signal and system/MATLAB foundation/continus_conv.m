%连续函数卷积的近视

%连续函数的卷积是先使用抽象信号对连续函数抽样，得到离散信号的序列，然后
%在使用离散序列的卷积方法卷积

%抽样间隔
dt=0.05;

%卷积函数x(t)=u(t)-u(t-1)
tx_start=0;
tx_end=1;

%卷积函数h(t)=sin(t)[u(t)-u(t-pi)]
th_start=0;
th_end=pi;

%得到抽样的时间序列的数量
Nx=fix((tx_end-tx_start)/dt);
Nh=fix((th_end-th_start)/dt);


%得到抽样的时间序列的标号，这个地方tx_start和th_start都是0
%但是一般情况下不是0，那么nx和nh开始的序列可能不一样，对应x轴有效范围上的不同
nx=fix(tx_start/dt)+(0:Nx-1);
nh=fix(th_start/dt)+(0:Nh-1);
% nx=nx*dt;
% nh=nh*dt;
%生成采样信号
x=ones(1,Nx);
%nh只是序列标号，乘以dt才是对应的x的值
h=sin(nh*dt);

%求离散卷积的范围
ny=(min(nx)+min(nh)):(max(nx)+max(nh));

%这里在离散卷积的基础上要乘以dt
y=conv(x,h)*dt;


%画出卷积之前的两个离散函数的图像,一定要记得乘以dt
subplot(3,1,1);
stem(nx*dt,x);
nx_ideal=0:0.01:1;
hold on;
plot(nx_ideal,heaviside(nx_ideal),'LineWidth',2,'Color','r');
axis([min(nx)*dt max(nx)*dt 0 max(x)]);

subplot(3,1,2);
stem(nh*dt,h);
nh_ideal=0:0.01:pi;
hold on;
plot(nh_ideal,sin(nh_ideal),'LineWidth',2,'Color','r');
axis([min(nh)*dt max(nh)*dt 0 max(h)]);


%画出卷积的函数图像
subplot(3,1,3);
stem(ny*dt ,y);
axis([min(ny)*dt max(ny)*dt 0 max(y)]);
hold on;
%画出理想的图像，进行对比y(t)
ny_ideal_1=0:0.01:1;
ny_ideal_2=1:0.01:pi;
ny_ideal_3=pi:0.01:(pi+1);

plot(ny_ideal_1,1-cos(ny_ideal_1),'LineWidth',2,'Color','r');
hold on;
plot(ny_ideal_2,cos(ny_ideal_2-1)-cos(ny_ideal_2),'LineWidth',2,'Color','r');
hold on;
plot(ny_ideal_3,cos(ny_ideal_3-1)+1,'LineWidth',2,'Color','r');



