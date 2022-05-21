% 0.13.信号的采样
clc;clear;
% 采样时间选取，采样间隔为0.0001s
T=3;Tss=0.0001;t=[0:Tss:T];
% 连续时间信号
xa=4*cos(2*pi*t);
xamin=min(xa);xamax=max(xa);
figure(1)
subplot(221)
plot(t,xa);grid
title('连续时间信号');ylabel('x(t)');xlabel('t sec');
%绘制坐标轴
axis([0 T 1.5*xamin 1.5*xamax])
N=length(t);
%总共有三组采样周期，那么我们就需要循环三次
for k=1:3
    %采样周期为0.1时,其中t为[0:0.1:3]的矩阵我们建立了一个30001个元素的矩阵，同时采集31组数据
    if k==1,Ts=0.1;subplot(222);
        t1=[0:Ts:T];n=1:Ts/Tss:N;xd=zeros(1,N);xd(n)=4*cos(2*pi*t1);
        plot(t,xa);hold on;stem(t,xd);grid;hold off
        axis([0 T 1.5*xamin 1.5*xamax]);ylabel('x(0.1 n)');xlabel('t')
    elseif k==2,Ts=0.5;subplot(223)
        t2=[0:Ts:T];n=1:Ts/Tss:N;xd=zeros(1,N);xd(n)=4*cos(2*pi*t2);
        plot(t,xa);hold on;stem(t,xd);grid;hold off
        axis([0 T 1.5*xamin 1.5*xamax]);ylabel('x(0.5 n)');xlabel('t')
    else Ts=1;subplot(224)
        t3=[0:Ts:T];n=1:Ts/Tss: N;xd=zeros(1,N);xd(n)=4*cos(2*pi*t3);
        plot(t,xa); hold on;stem(t,xd); grid; hold off
        axis([0 T 1.5*xamin 1.5*xamax]); ylabel('x(n)'); xlabel('t')
    end
end
        
     
