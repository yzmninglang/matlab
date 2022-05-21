clear all;
[y,Fs]=audioread('./necessary_boy.mp3');
% 随机选取一段样点

y_process=y;

% 对信号进行1024点傅里叶变换
subplot(3,1,1);
r=abs(fft(y_process));
f=(0:length(y))/length(y)*Fs;
plot(f(fix(length(y)*(100/Fs)):fix(length(y)*(400/Fs))),r(fix(length(y)*(100/Fs)):fix(length(y)*(400/Fs))));
% plot([1:3],[4:6]);


subplot(3,1,2)

r=20*log10(abs(fft(y_process)));
% r1=abs(r);
f=(0:length(y))/length(y)*Fs;
plot(f(fix(length(y)*(100/Fs)):fix(length(y)*(400/Fs))),r(fix(length(y)*(100/Fs)):fix(length(y)*(400/Fs))));
% plot([1:3],[4:6]);

subplot(3,1,3)
% % 对频域进行傅里叶变化
r_1=r(fix(length(y)*(100/Fs)):fix(length(y)*(2000/Fs)));
rr=abs(fft(r_1));
stem(rr(1:round(length(rr)/2)));

