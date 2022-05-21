%exm6_3_lsim.m



%产生仿真信号
t=0:0.5:8;
x=ones(1,length(t));


%LTI系统的系数矩阵
a=[1 4 3];
b=[1 2];


%使用传递函数生成系统模型
sys=tf(b,a);


%解析解
y2=2/3-exp(-t)/2-exp(-3*t)/6;

h=plot(t,y2,'b');
hold on;
set(h,'LineWidth',2);


%使用Lsim求响应
s=lsim(sys,x,t);
plot(t,s,'ro:');
xlabel('t');ylabel('单位阶跃响应:');
legend('解析解','仿真结果');
