
% 男声音频
[boy,Fs]=audioread('boy_ABC.wav');
boy=boy(:,1);
time=(0:length(boy)-1)/Fs;
% 分析一帧
boy=boy(find(time>1.72 & time <1.78));
time=time(find(time>1.72 & time <1.78));
subplot(3,1,1);
h=plot(time,boy);
set(h,'linewidth',2);
title('男声ABC');
xlabel('时间/s');
ylabel('幅度');
% axis([0.5 2 -1 1]);

% 男声频域
% boy_fft=abs(fft(boy));
% boy_fft=boy_fft/max(boy_fft);
% f=Fs*(0:length(boy))/length(boy);
% % 只看3000以内的
% n=fix(3000/Fs*length(boy));
% plot(f(1:n),boy_fft(1:n))
% title('男声ABC');
% xlabel('频率/Hz');
% ylabel('幅度');



% 女生音频
[girl,Fs]=audioread('girl_ABC.wav');
girl=girl(:,1);
time=(0:length(girl)-1)/Fs;
subplot(3,1,2);
h=plot(time(find(time>1.14 & time<1.15)),girl(find(time>1.14 & time<1.15)),':r');
set(h,'linewidth',2);
title('女生ABC');
xlabel('时间/s');
ylabel('幅度');
% axis([0.2 1.6 -1 1]);


% % 男声频域
% girl_fft=abs(fft(girl));
% girl_fft=girl_fft/max(girl_fft);
% f=Fs*(0:length(girl))/length(girl);
% % 只看3000以内的
% n=fix(3000/Fs*length(girl));
% plot(f(1:n),girl_fft(1:n))
% title('女生ABC');
% xlabel('频率/Hz');
% ylabel('幅度');
