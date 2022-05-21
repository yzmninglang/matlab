% 验证时域分辨率和频域分辨率的关系
% 可以探究分辨率和其参数的关系
Fs=1000;
Ts=1/Fs;

% 采样时间20ms,0.02s吧;
tt=0:1*Ts:(round(0.1/Ts)-1)*Ts;

syms f1 f2 t;
y=0.5*sin(2*pi*f1*t)+2*sin(2*pi*f2*t);

f1=10;
f2=40;
t=tt;

% 画出时域图
subplot(2,1,1);
y_number=subs(y);
y_number=double(y_number);
plot(tt,y_number);
set(get(gca, 'XLabel'), 'String', '时间/s');
set(get(gca, 'YLabel'), 'String', 'y');


% 画频谱图
y_fft=fft(y_number,200);
f=(0:length(y_fft)-1)/length(y_fft)*Fs;
N=length(y_fft);
subplot(2,1,2);
stem(f(1:fix(N/2+1)),abs(y_fft(1:fix(N/2+1))));




