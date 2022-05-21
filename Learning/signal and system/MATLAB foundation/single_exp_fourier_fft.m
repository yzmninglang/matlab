% 单边指数信号的傅里叶变换
% 假设a=1
t_high=double(solve('exp(-t)=0.0001'));
ws_half=double(abs(solve('1/(1i*w+1)=0.0001')));

% 设置采样频率为最高频率的2倍
ws=2*ws_half;

% 设置采样周期
Ts=2*pi/ws;
% 设置时间序列
t=0:Ts:t_high;

% 采样
x=exp(-t).*heaviside(t);

% 设置频域采样的总数N=2000;
N=2000;
X_fft=fft(x,N);
X_fft=fftshift(X_fft);

% 对频域解析解采样
w=-ws/2+(0:N-1)/N*ws;
X_w=1./(1i*w+1);


% 画幅频曲线
subplot(2,1,1);
h=semilogy(w,abs(X_fft)*Ts,'r:');
set(h,'linewidth',2);
xlabel('\omega(rad/s)');
ylabel('log_1_0(X_|\omega|)');
set(get(gca, 'Title'), 'String', 'fft');

% hold on;
subplot(2,1,2);
h=semilogy(w,abs(X_w));
set(h,'linewidth',2);
xlabel('\omega(rad/s)');
ylabel('log_1_0(X|\omega|)');
set(get(gca, 'Title'), 'String', 'X_\omega');

% 画象频曲线

figure();
subplot(2,1,1);
subplot(2,1,1);
h=semilogy(w,unwrap(angle(X_fft)),'r:');
set(h,'linewidth',2);
set(get(gca, 'Title'), 'String', 'fft');
xlabel('\omega(rad/s)');
ylabel('\phi(\omega)');

% hold on;
subplot(2,1,2);
h=semilogy(w,unwrap(angle(X_w)));
set(h,'linewidth',2);
set(get(gca, 'Title'), 'String', 'X_\omega');
xlabel('\omega(rad/s)');
ylabel('\phi(\omega)');


