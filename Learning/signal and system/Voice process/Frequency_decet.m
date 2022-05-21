% 截取一段语音信号，证明浊音语音信号具有周期性，然后在对其基频进行分析
[y,Fs]=audioread('./girl.wav');
y=y(:,1);
% 采样周期
Ts=1/Fs;

t=(0:(length(y)-1))*Ts;

% 选取0.65~0.68s(30ms)的波形
tt=t(round(1.145*Fs):round(1.156*Fs));

yy=y(round(1.145*Fs):round(1.156*Fs));
%这里是浊音的图像或者清音
plot(tt,yy);
% figure()
% plot(t,y);

% 得到复倒频谱
c = cceps(yy);
[~,I]=max(c);

% tt = 0:Ts:length(yy)*Ts-Ts;
% plot(tt,c);
% fprintf('Complex cepstrum F0 estimate is %3.2f Hz.\n',1/tt(I))