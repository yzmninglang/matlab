% 载入音频；


% 分帧

% 加入hamming window（窗函数）

% 做DFT

% 寻找基频(倒谱法)(自相关法)(小波变换分析)


% 读入音频信号y是采样数据,Fs是采样率
[y,Fs]=audioread('./14.wav');
% 取单通道
y=y(:,1);

% 总时间序列，采样间隔
t=(0:length(y)-1)*1/Fs;
Ts=1/Fs;
subplot(3,1,1);

% 将声音从0.5s截断到2.2s
t_cut=t(round(0.5*Fs):round(2.3*Fs));
y_cut=y(round(0.5*Fs):round(2.3*Fs));
% 画出时域波形
% plot(t,y);
plot(t_cut,y_cut);

% 分帧
y_fenzheng=enframe(y_cut,hanning(50),10);



