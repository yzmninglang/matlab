% 读入音频信号y是采样数据,Fs是采样率
[y,Fs]=audioread('./14.wav');
[y_boy,Fs_boy]=audioread('boy.wav');
% y是一个采样序列，Fs是采样率，Ts=1/fs也就是每两个序列的时间间隔（采样周期）
% 可以看出，音频的时间为length(y)*Ts，单位为s;
% 现在如果我想得到一个采样的时间序列可以通过[0:length(y)-1]*1/fs;
% Fs=9000;不能自定义它的采样率，不然就不准了，之前是多少就是多少
t=(0:length(y)-1)*1/Fs;
Ts=1/Fs;
% 取单声道
y=y(:,1);
y_boy=y_boy(:,1);

subplot(3,1,1);
% 画女生的
plot(t,y);
xlabel('t/s');
ylabel('y(t)');
title('时间');



subplot(3,1,2);
% 对该段声音信号做傅里叶变换
Y=fft(y);
N=length(y);
% 要得到频域图的频率轴，显然，频域范围不会超过采样频率，因为fft只是求出了一个周期的情况
% 可以提现的频率不会高于采样频率
% 而这个周期刚好是在0~Fs情况里面
f=(0:N-1)/N*Fs;
Y_abs=abs(Y)*Ts;
% plot(f(1:2000),Y_abs(1:2000));
% 由于是上限频率的两倍，所以实际上右边的图是
% 左边的图的重复
plot(f(1:fix(N/2)),Y_abs(1:fix(N/2)));
xlabel('f/HZ');
ylabel('|Y|');
set(get(gca, 'Title'), 'String', '幅度谱');
% 画男声的
% hold on
subplot(3,1,3);
Y_boy=fft(y_boy);
N=length(Y_boy);
f_boy=(0:N-1)/N*Fs_boy;
Y_boy_abs=abs(Y_boy)*Ts;
plot(f_boy(1:fix(N/2)),Y_boy_abs(1:fix(N/2)));
% plot(f_boy,)

% legend('gril','boy');




% 对频域信号进行操作，翻转声音
% subplot(3,1,3);
% y_inverse=ifft(conj(Y));
% plot(t,y_inverse);
% xlabel('t/s');
% ylabel('y(t)inverse');
% sound(y_inverse,Fs);
% set(get(gca, 'Title'), 'String', '声音翻转');