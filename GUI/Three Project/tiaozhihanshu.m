[y1,Fs_1]=audioread('A.wav');
[y2,Fs_2]=audioread('B.wav');
[y3,Fs_3]=audioread('C.wav');
y1=y1(:,1);
% 调幅指数
k=0.2;

%调制频率
fc1=2e4;
fc2=8e4;
fc3=14e4;

% 调制采样率
Fs1=4*fc3;
Fs2=4*fc3;
Fs3=4*fc3;
Fs=4*fc3;


% 解调频率
fj=fc1;

% 对声音重置采样率
y_resample=resample(y1,Fs1,Fs_1);

% 生成载波
t=(0:length(y_resample)-1)/Fs1;
zaibo=cos(2*pi*fc1*t);

% 第一个调制信号

AM_signal1=zeros(length(y_resample),1);
for b =1:length(AM_signal1)
    AM_signal1(b)=(y_resample(b)+k)*zaibo(b);
end

% 对第二个声音重采样样
y_resample=resample(y2,Fs2,Fs_2);

% 生成载波
t=(0:length(y_resample)-1)/Fs2;
zaibo=cos(2*pi*fc2*t);

% 第二个调制信号

AM_signal2=zeros(length(y_resample),1);
for b =1:length(AM_signal2)
    AM_signal2(b)=(y_resample(b)+k)*zaibo(b);
end


% 对第三个声音重采样样
y_resample=resample(y3,Fs3,Fs_3);
% 生成载波
t=(0:length(y_resample)-1)/Fs3;
zaibo=cos(2*pi*fc3*t);
% 第二个调制信号
AM_signal3=zeros(length(y_resample),1);
for b =1:length(AM_signal3)
    AM_signal3(b)=(y_resample(b)+k)*zaibo(b);
end

[~,ind]= max([length(AM_signal1) length(AM_signal2) length(AM_signal3)]);

if ind==1
    AM_signal=AM_signal1;
    AM_signal(1:length(AM_signal2))=AM_signal(1:length(AM_signal2))+AM_signal2;
    AM_signal(1:length(AM_signal3))=AM_signal(1:length(AM_signal3))+AM_signal3;

elseif ind==2
    AM_signal=AM_signal2;
    AM_signal(1:length(AM_signal1))=AM_signal(1:length(AM_signal1))+AM_signal1;
    AM_signal(1:length(AM_signal3))=AM_signal(1:length(AM_signal3))+AM_signal3;
else
    AM_signal=AM_signal3;
    AM_signal(1:length(AM_signal2))=AM_signal(1:length(AM_signal2))+AM_signal2;
    AM_signal(1:length(AM_signal1))=AM_signal(1:length(AM_signal1))+AM_signal1;
end
% AM_signal1=padarray(AM_signal1,[0 len-length(AM_signal1)]);
% AM_signal2=padarray(AM_signal2,[0 len-length(AM_signal1)]);
% AM_signal3=padarray(AM_signal3,[0 len-length(AM_signal1)]);

% AM_signal=zeros(len,1);

% AM_signal=AM_signal1;
f=(0:length(AM_signal)-1)/length(AM_signal)*Fs;
AM_fft=abs(fft(AM_signal));
plot(f(find(f<max(f)/2)),AM_fft(find(f<max(f)/2)));





zaibo=cos(2*pi*fc2*t);
% 解调信号
st =zeros(length(AM_signal),1);
for b =1:length(AM_signal)
    st(b)=AM_signal(b)*zaibo(b);
end



% 低通滤波器
fh = 10000;

fs=4*fc3;
% wp 设置截止频率（带通或者带阻） 
wp=fh/(fs/2);
N=128; 
% b=fir1(n,Wn,Window ) n滤波阶数，Wn截止频率，0≤Wn≤1，Wn=1对应于采样频率的一半。
% 当设计带通和带阻滤波器时， Wn=[W1 W2],W1≤ω≤W2。
% Window — 窗函数。窗函数的长度应等于FIR滤波器系数个数，即阶数 n+1。
% b返回滤波器系数
b=fir1(N,wp,'low');  
signa4 = filtfilt(b,1,st);
signa41=resample(signa4,20000,fs);
% plot(,abs(fft(signa4)))
sound(signa41,20000);