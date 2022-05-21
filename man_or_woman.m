function man_or_woman(file)
 
[x,fs]=audioread(file); % ���������ļ�
%======ʱ��ͼ��======  ����ʱ��������ֵ��ͼ
data=x(:,1);            %ȡ������
n=0:length(x)-1;        %����һ���źŵȳ�������
time=n/fs;              %����ʱ�����У���Ϊ������
figure(1);              %ͼ1��ʱ����ͼ
plot(time,data);        %��ͼ
title('��Ƶ�ź�ʱ��ͼ')  %����
xlabel('ʱ��/s');       %��ע������
ylabel('��ֵ');         %��ע������
grid on;                %��������
 
%=======Ƶ��ͼ======
N=length(data);         %ȡ�źž���ĳ���
Y1=fft(data,N);         %N�㸵��Ҷ�任
mag=abs(Y1);            %ȡģ
f=n*fs/N;               %Ƶ������
figure(2);              %ͼ2��Ƶ��ͼ
plot(f(1:fix(N/2)),mag(1:fix(N/2)));
title('��Ƶ�ź�fftƵ��ͼ');%����
xlabel('Ƶ��/Hz');       %��ע������
ylabel('����');          %��ע������
grid on;                 %��������
 
%======����Ƶ����ȡ======
[~,index]=max(data);          % �������ֵ ���ֵ����
timewin=floor(0.015*fs);
xwin=data(index-timewin:index+timewin);
[y,~]=xcov(xwin);
ylen=length(y);
halflen=(ylen+1)/2 +30;
yy=y(halflen: ylen);
[~,maxindex] = max(yy);
fmax=fs/(maxindex+30);
disp([file,'����Ƶ��Ϊ ', num2str(fmax), ' Hz'])
%======ͨ������Ƶ���ж���Ů��======
if fmax<200;
    disp([file,' �������ļ�']);
else
    disp([file,' ��Ů���ļ�']);
end;
 