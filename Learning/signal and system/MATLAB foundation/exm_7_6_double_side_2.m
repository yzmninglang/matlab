% 官方的代码
t_trancate=solve('exp(-2*t)=0.0001');
t_trancate=double(t_trancate);
ws_half=solve('4/(w*w+4)=0.001');
ws_half=double(ws_half);
% 抽样角频率
ws=2*abs(ws_half(1));
% 抽样间隔
Ts=2*pi/ws;
t=-t_trancate:Ts:t_trancate;
x=exp(-2*abs(t));
subplot(2,1,1);
h=plot(t,x);
set(h,'linewidth',2);
xlabel('t/s');
ylabel('exp(-2|t|)');
% 频率点的计算
N=256;
w=-ws/2+(0:N-1)/N*ws;
X=4./(w.*w+4);
subplot(2,1,2);
h=plot(w,X);
set(h,'linewidth',2);
xlabel('\omega/(rad/s)');
ylabel('X(j\omega)');



% 使用fft计算
X_fft=fft(x,N);
X_fft=Ts*X_fft;
X_fft=fftshift(X_fft);
subplot(2,1,1);
h=semilogy(w,abs(X));
set(h,'linewidth',2);
xlabel('\omega/(rad/s)');
ylabel('log_1_0(|\omega|)');
hold on;
h=semilogy(w,abs(X_fft),'r:');
set(h,'linewidth',2);
legend('real','fft');
subplot(2,1,2);
h=plot(w,unwrap(angle(X_fft)));
set(h,'linewidth',2);
xlabel('\omega(rad/s)');
ylabel('\phi(\omega)');

