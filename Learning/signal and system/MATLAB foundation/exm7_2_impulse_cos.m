%用三角函数合成冲激函数
% impulse=1/T(1+cos(w1t)+2cos(2w1t)+....)


%设置周期冲击函数的周期为1
T=1;
w1=2*pi/T;

%设置要显示的x轴的范围和采样的间隔为t
t=-1.2*T:0.01:1.2*T;

%这个设置cos(nw1t)的最大n,
N=10;
xN=ones(1,length(t))/T;
clf;

%画出一条直线,对应分解出来的第一项
plot(t,xN,'m');xlabel('t');ylabel('x_N(t)');
hold on;
color = ['m','r','g','b'];
% 从第二项开始，每一项在原来的基础之上加上一个cos(nw1t),并且画出叠加的图像
for n=1:N-1
    xn=cos(n*w1*t)/T*2;
    xN=xN+xn;
    plot(t,xN,color(mod(n,length(color))+1));
end

% 这里是对最后得到的图像进行一个描绘，使得它变粗，更明显
h=plot(t,xN,'k');
set(h,'lineWidth',2);
axis([-1.2*T,1.2*T,min(xN)*1.1,max(xN)*1.1]);
