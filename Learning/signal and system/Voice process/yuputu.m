clear all;
[y,Fs]=audioread('./necessary_boy.mp3');

s=length(y);
% 窗长，取44ms的窗长(w/Fs=T=44ms)
w=round(44*Fs/1000);

% fft的点数
n=w;
% 50%的重叠
ov=w/2;
% 窗函数移动的步长
h=w-ov;
% 调用汉明窗
win=hamming(n);
c=1;
% 窗函数总共需要移动的步数，取整
ncols=1+fix((s-n)/h);

% d的列是每一帧的fft，因为fft有一半是没有用的
% 所以只需要fft一半的长度即可
d=zeros((1+n/2),ncols);

c=1;

for b=0:h:(s-n)
    u=win.*y((b+1):(b+n));
    t=fft(u);
    d(:,c)=t(1:(1+n/2));
    c=c+1;
end
% 时间序列，以步长来取数
tt=(0:h:(s-n))/Fs;

ff=(0:(n/2))*Fs/n;

imagesc(tt/1000,ff/1000,20*log10(abs(d)));
colormap(gray);
axis xy;
set(get(gca, 'XLabel'), 'String', '时间/s');
set(get(gca, 'YLabel'), 'String', '频率/kHz');

