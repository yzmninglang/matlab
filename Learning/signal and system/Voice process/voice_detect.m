% 读取源文件
% 分帧
% 加窗
% 去倒谱
% 找出倒谱最大值


% 截取一段语音信号，证明浊音语音信号具有周期性，然后在对其基频进行分析
[y,Fs]=audioread('xin5.wav');
y=y(:,1);


% 声音预加载
% y_process=filter([1 -0.98],1,y);
% y_process=y_process/max(y_process);

% 对声音信号进行归一化
y_process=y/max(y);

% 采样周期
Ts=1/Fs;
% 分帧
% wlen=800;%帧长保证帧长在20ms
wlen=fix(0.020*Fs);
inc=fix(wlen*0.25);
win=hamming(wlen);%海明窗
N=length(y_process);%信号长度
time=(0:N-1)/Fs;% 计算出信号的时间刻度(不是帧的时间刻度)

X=enframe(y_process,win,inc)'; %分帧,一列是一帧,这里一定要转置
fn=size(X,2);%帧数

% 这个所对应的时间需要自己算
frameTime=(0:(fn-1))/fn*(length(y_process)/Fs);  %求出每帧对应的时间
%这个公式得再看一下

% 短时能量E(n),n代表第n帧

% 给短时能量生成空间，提高代码的速度
En=zeros(1,fn);


fn=size(X,2);              % 求出帧数
for i=1 : fn
    u=X(:,i);              % 取出一帧
    u2=u.*u;               % 求出能量
    En(i)=sum(u2);         % 对一帧累加求和
end
% 对能量进行归一化处理
En_ratio=En/max(En);
% 计算每帧的过零数 Z
% fn这里为帧数
Z=zeros(1,fn);                 % 初始化
for i=1:fn
        y=X(:,i);%每一帧数据
        b=0;
        for m=1:1:(wlen-1)  %根据帧长来定的
            if y(m)*y(m+1)<0
                b=b+1;
            end
        Z(i)=b;
        end
end

% 求出过零率
Zratio=Z/length(X(:,i));
subplot(3,1,1);
plot(time,y_process);
hold on;
% h=plot(frameTime,Zratio);
% set(h,'linewidth',2);
h=plot(frameTime,En/max(En));
set(h,'linewidth',2);
axis([0 2 -1 1]);
legend('sound signal','Energy');
set(get(gca, 'Title'), 'String', 'Signal and Short term energy');
subplot(3,1,2);
stem(frameTime,Z);
set(get(gca, 'Title'), 'String', ' Zero Crossing ratio');
set(get(gca, 'XLabel'), 'String', '帧时间');
set(get(gca, 'YLabel'), 'String', '过零的总点数');
axis([0 2 0 500]);

% subplot(2,1,2);
% plot(Zratio);

% 使用能量的角度去判断





%语音的是否发声的情况
% 0表示不发声
% 1表示发声
w=zeros(1,fn);
% 找出所有的能量较高值
Energy_meet_index=find(En_ratio>0.12);
w(Energy_meet_index)=1;
% 观察情况
hold on;
stem(frameTime,w*200);
legend('过零率','能量满足');


% 找出这些点中过零率小于100的,得到满足浊音的index

speak_index=intersect(find(Z<100),Energy_meet_index);
% 画图
w=zeros(1,fn);
w(speak_index)=1;
subplot(3,1,3);
stem(frameTime,w);
axis([0 2 0 2]);
set(get(gca, 'Title'), 'String', '满足能量和过零率的帧');
set(get(gca, 'XLabel'), 'String', '帧时间');
set(get(gca, 'YLabel'), 'String', '是否满足');


% 观察和对比加窗和不加窗的傅里叶变换的区别
% 取出一帧
figure();
ee=X(:,speak_index(2));
% 从步长开始算
% etime=frameTime(0:Ts:(wlen-1)*Ts);
% % plot(etime,ee);

% 取出没有加窗函数的一帧
% 取出一帧一半的时间
T_f_half=inc/Fs;
T_index=(speak_index(2)-1)*inc;
% T_index=T_f_half*(speak_index(1)-1);

et=T_index/Fs:Ts:(T_index+wlen-1)/Fs;
ee_nowin=y_process(T_index:(T_index+wlen-1));
subplot(3,1,1)
h=plot(et,ee);
set(h,'linewidth',2);
hold on;
h=plot(et,ee_nowin);
legend('加窗','不加窗');
set(h,'linewidth',2);
set(get(gca, 'Title'), 'String', '是否加hamming窗的影响');

subplot(3,1,2);
X_fft=20*log10(abs(fft(ee_nowin,1024)));
f=(0:1:511)*Fs/1024;
plot(f,X_fft(1:fix(length(X_fft)/2)));
set(get(gca, 'Title'), 'String', '未加汉明窗的频谱图');
set(get(gca, 'YLabel'), 'String', '幅度/dB');


% 加汉明窗的频域幅频图
subplot(3,1,3);
X_fft=20*log10(abs(fft(ee,1024)));
f=(0:1:511)*Fs/1024;
plot(f,X_fft(1:fix(length(X_fft)/2)));
set(get(gca, 'Title'), 'String', '加汉明窗的频谱图');
set(get(gca, 'YLabel'), 'String', '幅度/dB');


% 求倒谱，计算基频，使用已经加了汉明窗的去计算,只计算有浊音的
y_need_cepstrum=X(:,speak_index);
% 求出倒谱
y_cepstrum_speak=rceps(y_need_cepstrum);

% 将没有声音的那一段补上0
y_cepstrum=zeros(size(X,1),size(X,2));
y_cepstrum(:,speak_index)=y_cepstrum_speak;

figure();
% plot(y_cepstrum_speak);

% figure();

% 拿出一列进行分析,像频域一样，只需要看一段
% y_cepstrum_analysis=y_cepstrum(1:fix(wlen/2),5);
% figure();
% plot(y_cepstrum_analysis);

% 基音检测,只检测基频，所以Fs/基频
% Ts*N1=T_min Ts*N2=T_max,求出N1=1/Ts*T_min=Fs/f_min
LF=floor(Fs/500);
HF=floor(Fs/70);
% [mx_cep,ind]=max(y_cepstrum(LF:HF));
% if mx_cep>0.08 && ind>0
%     a=Fs/(LF+ind);

% else
%     a=0;
    
% end

% pith=a;

% 序列求基音频率,不只分析浊音，所以最终序列会等于fn
foundmental_frequency=zeros(1,size(y_cepstrum,2));
% 
FoundmentalFrequencyDot=zeros(1,size(y_cepstrum,2));
% for k=1:size(y_cepstrum,2)
%     y_cepstrum_analysis=y_cepstrum(:,k);
%     [mx_cep,ind]=max(y_cepstrum_analysis(LF:HF));
%     if mx_cep>0.08 && ind>0
%         foundmental_frequency(k)=Fs/(LF+ind);
%         % 每个频率下对应的样本点数
%         FoundmentalFrequencyDot(k)=ind+LF;
%     else
%         foundmental_frequency(k)=0;   
%         FoundmentalFrequencyDot(k)=0;
%     end
% end
% 设置需要平滑的序列
FoundmentalFrequencyDotNeedSmooth=[];
for k=1:size(y_cepstrum_speak,2)
    y_cepstrum_analysis=y_cepstrum_speak(:,k);
    [mx_cep,ind]=max(y_cepstrum_analysis(LF:HF));
    if mx_cep>0.08 && ind>0
        foundmental_frequency(k)=Fs/(LF+ind);
        % 每个频率下对应的样本点数
        FoundmentalFrequencyDotNeedSmooth=[FoundmentalFrequencyDotNeedSmooth ind+LF];
        FoundmentalFrequencyDot(speak_index(k))=ind+LF;
    else
        foundmental_frequency(k)=0;   
        FoundmentalFrequencyDot(k)=0;
        % FoundmentalFrequencyDotNeedSmooth(k)=0;
        FoundmentalFrequencyDot(speak_index(k))=0;
    end
end


% plot(foundmental_frequency);
% plot(frameTime,FoundmentalFrequencyDot);
plot(FoundmentalFrequencyDotNeedSmooth);

hold on;
% 对FoundmentalFrequencyDot线性平滑
% 设计一个平滑滤波器x=[0.1 0.2 0.4  0.2 0,1]
% filter_1=[0.2 0.3 0.3 0.2];
% FoundmentalFrequencyDotFiltered=filter(filter_1,1,FoundmentalFrequencyDotNeedSmooth);

% 中值滤波
FoundmentalFrequencyDotFiltered=movmedian(FoundmentalFrequencyDotNeedSmooth,3);

plot(FoundmentalFrequencyDotFiltered);

set(get(gca, 'Title'), 'String', '浊音倒谱有效序列');
set(get(gca, 'XLabel'), 'String', 'Speak Voice Index');
set(get(gca, 'YLabel'), 'String', 'Number of dots');
legend('没有滤波','滤波之后');

ffe_filtered=Fs./(FoundmentalFrequencyDotFiltered(FoundmentalFrequencyDotFiltered>0));







% 有效基频
% foundmental_frequency_1=foundmental_frequency.*En_ratio;
% frequency=0;
% % 这是原来ffe的判断方法
% ffe=foundmental_frequency(foundmental_frequency>0);
% if length(ffe(ffe<190))>length(ffe(ffe>=190))
%     disp('Boy')
%     frequency=mean(ffe(find(ffe>0 & ffe <250)));
% end
% if length(ffe(ffe>220))>length(ffe(ffe<=210))
%     disp('gril')
%     frequency=mean(ffe(find(ffe>180 & ffe<450)));
% end
figure();
% stem(ffe)
plot(y_cepstrum_speak(1:fix(size(y_cepstrum_speak,1)/2),:));
set(get(gca, 'Title'), 'String', ['Sample Rate:',num2str(Fs)]);
% ffe_T=1./ffe;

% 这是ffe_fliter的方法
ffe=foundmental_frequency(foundmental_frequency>0);
if length(ffe_filtered(ffe_filtered<200))>=length(ffe_filtered(find(ffe_filtered>=210 & ffe_filtered<420)))
    disp('Boy')
    frequency=mean(ffe_filtered(find(ffe_filtered>60 & ffe_filtered <250)));
else
    disp('gril')
    frequency=mean(ffe_filtered(find(ffe_filtered>180 & ffe_filtered<440)));
end
disp(['Frequency:',num2str(frequency)]);


% 对ffe进行平滑处理


% 画出频谱图
% figure();
% X_fft=abs(fft(X));
% f=(0:wlen-1)/wlen*Fs;
% plot(f(1:fix(wlen/2)),X_fft(1:fix(wlen/2),speak_index(1)));
% plot(length(ffe(2)),ffe(2))
% p=y_cepstrum_speak(:,3);
% plot((1:fix(Fs/600))*Ts,p(1:fix(Fs/600)));

% plot(y_cepstrum_speak)
