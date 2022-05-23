clear all;
[y,Fs]=audioread('./necessary_boy.mp3');

s=length(y);
% ������ȡ44ms�Ĵ���(w/Fs=T=44ms)
w=round(44*Fs/1000);

% fft�ĵ���
n=w;
% 50%���ص�
ov=w/2;
% �������ƶ��Ĳ���
h=w-ov;
% ���ú�����
win=hamming(n);
c=1;
% �������ܹ���Ҫ�ƶ��Ĳ�����ȡ��
ncols=1+fix((s-n)/h);

% d������ÿһ֡��fft����Ϊfft��һ����û���õ�
% ����ֻ��Ҫfftһ��ĳ��ȼ���
d=zeros((1+n/2),ncols);

c=1;

for b=0:h:(s-n)
    u=win.*y((b+1):(b+n));
    t=fft(u);
    d(:,c)=t(1:(1+n/2));
    c=c+1;
end
% ʱ�����У��Բ�����ȡ��
tt=(0:h:(s-n))/Fs;

ff=(0:(n/2))*Fs/n;

imagesc(tt/1000,ff/1000,20*log10(abs(d)));
colormap(gray);
axis xy;
set(get(gca, 'XLabel'), 'String', 'ʱ��/s');
set(get(gca, 'YLabel'), 'String', 'Ƶ��/kHz');

