clear all;
syms n T t x

% 这里采用的是符号积分，可以不给出确切的值，上下限也可以是符号（字符串）
intergend=exp(-1i*n*(2*pi/T)*t)/T;
Xn=int(intergend,t,'-T/4','T/4');

% 单独计算直流分量a0=0.5
n=-11:-1;
Xn_left=double(subs(Xn));
n=1:11;
xn_right=double(subs(Xn));
% 放入一个序列之中再作图
Xn_N=[Xn_left 0.5 xn_right];
n=-11:11;
% h=stem(n,Xn_N);
% set(h,'lineWidth',2);
% xlabel('n');
% ylabel('X_n');


%合成矩形波,Xn_N是我的一个序列，一共有23个数
T=2;

% 作图的x范围
t=-T:0.01:T;

% 作图的y轴
x_t=zeros(1,length(t));
x_t=x_t*Xn_N(12);
plot(t,x_t);
hold on;


% 这里一定要注意，由于-11.....0.....11所以第一个数是-11,那么与之对应的就是23-1的+11，这个地方容易出错，
% 一定要注意
for c=1:11
    x_t=x_t+Xn_N(-c+12)*exp(1i*2*(-c)*pi/T*t)+Xn_N(c+12)*exp(1i*2*(c)*pi/T*t);
    plot(t,x_t);
end
plot(t,x_t);
axis([-T T,-0.75,0.75]);

