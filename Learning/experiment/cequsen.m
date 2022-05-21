clear all;
Fs=1/0.001;
% 验证倒谱是否真的有用
t=-2*pi:0.001:2*pi;
y=5*sin(2*t);
y2=sin(1600*t);
y4=sin(7*t);
subplot(3,1,1)
h=plot(t,y);
set(h,'linewidth',2);
hold on 
h=plot(t,y2);
set(h,'linewidth',2);

L=length(t);
% 两个信号相乘的情况
y3=y.*y2.*y4;
h=plot(t,y3);
set(h,'linewidth',2);
legend('3*sin(t)','sin(16t)','3*sin(t)*sin(16t)');

subplot(3,1,2);
x_fft=abs(fft(y3));
plot(Fs*(1:fix(length(y3)/2))/(length(y3)),x_fft(1:fix(length(y3)/2))/(length(y3)));

recp=rceps(y3);
subplot(3,1,3);
% plot((t(1:fix(L/2))+2*pi),recp(1:fix(L/2)))
plot(t,recp)