function [AM_signal,Fs] = tiaozhi(~)


 % ���ص����źţ��Լ��źŵĲ�����
    

[y1,Fs_1]=audioread('A.wav');
[y2,Fs_2]=audioread('B.wav');
[y3,Fs_3]=audioread('zhangchufa.wav');
y1=y1(:,1);
% ����ָ��
k=0.2;

%����Ƶ��
fc1=2e4;
fc2=3e4;
fc3=4e4;

% ���Ʋ�����
Fs1=4*fc3;
Fs2=4*fc3;
Fs3=4*fc3;
Fs=4*fc3;


% ���Ƶ��
% fj=fc1;

% ���������ò�����
y_resample=resample(y1,Fs1,Fs_1);

% �����ز�
t=(0:length(y_resample)-1)/Fs1;
zaibo=cos(2*pi*fc1*t);

% ��һ�������ź�

AM_signal1=zeros(length(y_resample),1);
for b =1:length(AM_signal1)
    AM_signal1(b)=(y_resample(b)+k)*zaibo(b);
end

% �Եڶ��������ز�����
y_resample=resample(y2,Fs2,Fs_2);

% �����ز�
t=(0:length(y_resample)-1)/Fs2;
zaibo=cos(2*pi*fc2*t);

% �ڶ��������ź�

AM_signal2=zeros(length(y_resample),1);
for b =1:length(AM_signal2)
    AM_signal2(b)=(y_resample(b)+k)*zaibo(b);
end


% �Ե����������ز�����
y_resample=resample(y3,Fs3,Fs_3);
% �����ز�
t=(0:length(y_resample)-1)/Fs3;
zaibo=cos(2*pi*fc3*t);
% �ڶ��������ź�
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


% ������֮��Ĳ���ͼ
% f=(0:length(AM_signal)-1)/length(AM_signal)*Fs;
% AM_fft=abs(fft(AM_signal));
% plot(f(find(f<max(f)/2)),AM_fft(find(f<max(f)/2)));



end