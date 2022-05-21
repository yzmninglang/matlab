%6-3


%方程左右两边的系数
a=[1 7 10];
b=[1 6 4];

%得到系统的模型
sys=tf(b,a);



%产生仿真信号e(t)=4u(t)
t=0:0.5:8;
x=ones(1,length(t))*4;


%使用lsim仿真4u（t）信号
subplot(3,1,1);
s=lsim(sys,x,t);
plot(t,s,'ro:');
title('4u(t)');
xlabel('time');

%使用impulse仿真信号
subplot(3,1,2);
impulse(sys);


%使用step仿真阶跃信号
subplot(3,1,3);
step(sys);

