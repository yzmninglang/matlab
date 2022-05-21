% 设计抽样间隔


% 经过使用solve计算w_max大概是1,不妨假设取抽样频率为4,a=1
ws=4;
Ts=2*pi/ws;

%时域经过计算，当a=1时，取7;
a=1;
% 所以得到的时间序列如下
t=-7:Ts:7;

%对符号函数进行采样,先设置采样间隔w_s
w=linspace(-1,1,300);


% syms a t w
% 时域

x=exp(-a*t).*heaviside(t);

% 频域
X=1./(1i*w+a);

% x_t=subs(x);

% 对得到的序列进行快速傅里叶变换
X_fft=fft(x,length(w))*Ts;
X_fft=fftshift(X_fft);


%采样
% X_w=double(subs(X));

% 画fft的函数图像
h=semilogy(w,abs(X_fft));
set(h,'linewidth',2);
% legend('fft');
hold on;


% 画X_w的图像;

h=semilogy(w,abs(X));
set(h,'linewidth',2);
legend('fft','X_w');

