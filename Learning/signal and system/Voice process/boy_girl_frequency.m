
% ������Ƶ
[boy,Fs]=audioread('boy_ABC.wav');
boy=boy(:,1);
time=(0:length(boy)-1)/Fs;
% ����һ֡
boy=boy(find(time>0.72 & time <2.1));
time=time(find(time>0.72 & time <2.1));
subplot(3,1,1);
boy= boy+rand(length(boy),1)*0.1-rand(length(boy),1)*0.1;
h=plot(time,boy);
axis([0.6 2.5 -1.5 1.5]);
% set(h,'linewidth',2);
title('����ABC');
xlabel('ʱ��/s');
ylabel('����');



% win=hamming(length(boy));

% h=plot(time,boy);
% set(h,'linewidth',2);
% title('����ABC');
% xlabel('ʱ��/s');
% ylabel('����');
% % axis([0.5 2 -1 1]);
% % ����Ƶ��
% boy_fft=abs(fft(boy));
% boy_fft=boy_fft/max(boy_fft);
% f=Fs*(0:length(boy))/length(boy);
% % ֻ��3000���ڵ�
% n=fix(3000/Fs*length(boy));
% h=plot(f(1:n),boy_fft(1:n));
% set(h,'linewidth',2);
% title('����ABC');
% xlabel('Ƶ��/Hz');
% ylabel('����');
% % hold on;
% boy=boy.*win;

% ����Ƶ��
% boy_fft=abs(fft(boy));
% boy_fft=boy_fft/max(boy_fft);
% f=Fs*(0:length(boy))/length(boy);
% % ֻ��3000���ڵ�
% n=fix(3000/Fs*length(boy));
% h=plot(f(1:n),boy_fft(1:n));
% set(h,'linewidth',2);
% title('����ABC');
% xlabel('Ƶ��/Hz');
% ylabel('����');



% Ů����Ƶ
[girl,Fs]=audioread('girl_ABC.wav');
girl=girl(:,1);
time=(0:length(girl)-1)/Fs;
subplot(3,1,3);
h=plot(time(find(time>1.14 & time<1.15)),girl(find(time>1.14 & time<1.15)),':r');
set(h,'linewidth',2);
title('Ů��ABC');
xlabel('ʱ��/s');
ylabel('����');
% axis([0.2 1.6 -1 1]);


% % ����Ƶ��
% girl_fft=abs(fft(girl));
% girl_fft=girl_fft/max(girl_fft);
% f=Fs*(0:length(girl))/length(girl);
% % ֻ��3000���ڵ�
% n=fix(3000/Fs*length(girl));
% plot(f(1:n),girl_fft(1:n))
% title('Ů��ABC');
% xlabel('Ƶ��/Hz');
% ylabel('����');
