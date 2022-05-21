% 选取时域抽样和频域抽样的上下限
t_trancate=double(solve('exp(-2*t)=0.0001'));

ws_half=double(solve('4/(w*w+4)=0.001'));

%时域抽样频率作为频域最大频率上限的2倍
ws=ws_half;
ws=abs(ws(1))*2;

%抽样周期(间隔)Ts
Ts=2*pi/ws;


% 生成时间抽样的序列
t=-t_trancate:Ts:t_trancate;
x=exp(-2*abs(t));
subplot(2,1,1);
plot(t,x);
xlabel('t');
ylabel('exp(-2|t|)');


%频域抽样绘图：已知傅里叶变换的函数表达式x(w)=4/(w^2+4)
% 确定抽样256个点
N=256;

w=-ws/2+ws*(0:N-1)/N;
X=4./(w.^2+4);
subplot(2,1,2);
h=plot(w,X);
xlabel('\omega');
ylabel('X(\omega)');


% 使用fft抽样，并与频域抽样对比

% 将上面得到的x序列放入fft中，生成N个点
% 实际上在原来的时域上添加0，但是又我们抽样的性质知道，时域上本来使我们
% 截取的一段，这一段包含了绝大部分这个信号的信息，没有截取的那一部分
% 实际上都是接近0的，所以fft这里这么做是合理的,而且fft的返回值和原来x的序列大小一致


X_fft=fft(x,N);

% 系数调整,fft只能算出一部分，这还不是离散傅里叶变换的实际值
X_fft=Ts*X_fft;


% 将频谱调为关于y轴对称
X_fft=fftshift(X_fft);

% 绘制频谱图，纵轴采用对数坐标
figure;
subplot(2,1,1);
% 画图，和plot一样，就是y轴以10为底数而已
h=semilogy(w,abs(X));
set(h,'linewidth',2);
xlabel('\omega/(rad/s)');
ylabel('log_1_0(X(\omega))');
hold on;
h=semilogy(w,abs(X_fft),'r:');
set(h,'linewidth',2);
legend('real','fft');

subplot(2,1,2);
h=plot(w,unwrap(angle(X_fft)));




