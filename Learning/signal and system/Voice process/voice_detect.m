% ��ȡԴ�ļ�
% ��֡
% �Ӵ�
% ȥ����
% �ҳ��������ֵ


% ��ȡһ�������źţ�֤�����������źž��������ԣ�Ȼ���ڶ����Ƶ���з���
[y,Fs]=audioread('xin5.wav');
y=y(:,1);


% ����Ԥ����
% y_process=filter([1 -0.98],1,y);
% y_process=y_process/max(y_process);

% �������źŽ��й�һ��
y_process=y/max(y);

% ��������
Ts=1/Fs;
% ��֡
% wlen=800;%֡����֤֡����20ms
wlen=fix(0.020*Fs);
inc=fix(wlen*0.25);
win=hamming(wlen);%������
N=length(y_process);%�źų���
time=(0:N-1)/Fs;% ������źŵ�ʱ��̶�(����֡��ʱ��̶�)

X=enframe(y_process,win,inc)'; %��֡,һ����һ֡,����һ��Ҫת��
fn=size(X,2);%֡��

% �������Ӧ��ʱ����Ҫ�Լ���
frameTime=(0:(fn-1))/fn*(length(y_process)/Fs);  %���ÿ֡��Ӧ��ʱ��
%�����ʽ���ٿ�һ��

% ��ʱ����E(n),n�����n֡

% ����ʱ�������ɿռ䣬��ߴ�����ٶ�
En=zeros(1,fn);


fn=size(X,2);              % ���֡��
for i=1 : fn
    u=X(:,i);              % ȡ��һ֡
    u2=u.*u;               % �������
    En(i)=sum(u2);         % ��һ֡�ۼ����
end
% ���������й�һ������
En_ratio=En/max(En);
% ����ÿ֡�Ĺ����� Z
% fn����Ϊ֡��
Z=zeros(1,fn);                 % ��ʼ��
for i=1:fn
        y=X(:,i);%ÿһ֡����
        b=0;
        for m=1:1:(wlen-1)  %����֡��������
            if y(m)*y(m+1)<0
                b=b+1;
            end
        Z(i)=b;
        end
end

% ���������
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
set(get(gca, 'XLabel'), 'String', '֡ʱ��');
set(get(gca, 'YLabel'), 'String', '������ܵ���');
axis([0 2 0 500]);

% subplot(2,1,2);
% plot(Zratio);

% ʹ�������ĽǶ�ȥ�ж�





%�������Ƿ��������
% 0��ʾ������
% 1��ʾ����
w=zeros(1,fn);
% �ҳ����е������ϸ�ֵ
Energy_meet_index=find(En_ratio>0.12);
w(Energy_meet_index)=1;
% �۲����
hold on;
stem(frameTime,w*200);
legend('������','��������');


% �ҳ���Щ���й�����С��100��,�õ�����������index

speak_index=intersect(find(Z<100),Energy_meet_index);
% ��ͼ
w=zeros(1,fn);
w(speak_index)=1;
subplot(3,1,3);
stem(frameTime,w);
axis([0 2 0 2]);
set(get(gca, 'Title'), 'String', '���������͹����ʵ�֡');
set(get(gca, 'XLabel'), 'String', '֡ʱ��');
set(get(gca, 'YLabel'), 'String', '�Ƿ�����');


% �۲�ͶԱȼӴ��Ͳ��Ӵ��ĸ���Ҷ�任������
% ȡ��һ֡
figure();
ee=X(:,speak_index(2));
% �Ӳ�����ʼ��
% etime=frameTime(0:Ts:(wlen-1)*Ts);
% % plot(etime,ee);

% ȡ��û�мӴ�������һ֡
% ȡ��һ֡һ���ʱ��
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
legend('�Ӵ�','���Ӵ�');
set(h,'linewidth',2);
set(get(gca, 'Title'), 'String', '�Ƿ��hamming����Ӱ��');

subplot(3,1,2);
X_fft=20*log10(abs(fft(ee_nowin,1024)));
f=(0:1:511)*Fs/1024;
plot(f,X_fft(1:fix(length(X_fft)/2)));
set(get(gca, 'Title'), 'String', 'δ�Ӻ�������Ƶ��ͼ');
set(get(gca, 'YLabel'), 'String', '����/dB');


% �Ӻ�������Ƶ���Ƶͼ
subplot(3,1,3);
X_fft=20*log10(abs(fft(ee,1024)));
f=(0:1:511)*Fs/1024;
plot(f,X_fft(1:fix(length(X_fft)/2)));
set(get(gca, 'Title'), 'String', '�Ӻ�������Ƶ��ͼ');
set(get(gca, 'YLabel'), 'String', '����/dB');


% ���ף������Ƶ��ʹ���Ѿ����˺�������ȥ����,ֻ������������
y_need_cepstrum=X(:,speak_index);
% �������
y_cepstrum_speak=rceps(y_need_cepstrum);

% ��û����������һ�β���0
y_cepstrum=zeros(size(X,1),size(X,2));
y_cepstrum(:,speak_index)=y_cepstrum_speak;

figure();
% plot(y_cepstrum_speak);

% figure();

% �ó�һ�н��з���,��Ƶ��һ����ֻ��Ҫ��һ��
% y_cepstrum_analysis=y_cepstrum(1:fix(wlen/2),5);
% figure();
% plot(y_cepstrum_analysis);

% �������,ֻ����Ƶ������Fs/��Ƶ
% Ts*N1=T_min Ts*N2=T_max,���N1=1/Ts*T_min=Fs/f_min
LF=floor(Fs/500);
HF=floor(Fs/70);
% [mx_cep,ind]=max(y_cepstrum(LF:HF));
% if mx_cep>0.08 && ind>0
%     a=Fs/(LF+ind);

% else
%     a=0;
    
% end

% pith=a;

% ���������Ƶ��,��ֻ���������������������л����fn
foundmental_frequency=zeros(1,size(y_cepstrum,2));
% 
FoundmentalFrequencyDot=zeros(1,size(y_cepstrum,2));
% for k=1:size(y_cepstrum,2)
%     y_cepstrum_analysis=y_cepstrum(:,k);
%     [mx_cep,ind]=max(y_cepstrum_analysis(LF:HF));
%     if mx_cep>0.08 && ind>0
%         foundmental_frequency(k)=Fs/(LF+ind);
%         % ÿ��Ƶ���¶�Ӧ����������
%         FoundmentalFrequencyDot(k)=ind+LF;
%     else
%         foundmental_frequency(k)=0;   
%         FoundmentalFrequencyDot(k)=0;
%     end
% end
% ������Ҫƽ��������
FoundmentalFrequencyDotNeedSmooth=[];
for k=1:size(y_cepstrum_speak,2)
    y_cepstrum_analysis=y_cepstrum_speak(:,k);
    [mx_cep,ind]=max(y_cepstrum_analysis(LF:HF));
    if mx_cep>0.08 && ind>0
        foundmental_frequency(k)=Fs/(LF+ind);
        % ÿ��Ƶ���¶�Ӧ����������
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
% ��FoundmentalFrequencyDot����ƽ��
% ���һ��ƽ���˲���x=[0.1 0.2 0.4  0.2 0,1]
% filter_1=[0.2 0.3 0.3 0.2];
% FoundmentalFrequencyDotFiltered=filter(filter_1,1,FoundmentalFrequencyDotNeedSmooth);

% ��ֵ�˲�
FoundmentalFrequencyDotFiltered=movmedian(FoundmentalFrequencyDotNeedSmooth,3);

plot(FoundmentalFrequencyDotFiltered);

set(get(gca, 'Title'), 'String', '����������Ч����');
set(get(gca, 'XLabel'), 'String', 'Speak Voice Index');
set(get(gca, 'YLabel'), 'String', 'Number of dots');
legend('û���˲�','�˲�֮��');

ffe_filtered=Fs./(FoundmentalFrequencyDotFiltered(FoundmentalFrequencyDotFiltered>0));







% ��Ч��Ƶ
% foundmental_frequency_1=foundmental_frequency.*En_ratio;
% frequency=0;
% % ����ԭ��ffe���жϷ���
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

% ����ffe_fliter�ķ���
ffe=foundmental_frequency(foundmental_frequency>0);
if length(ffe_filtered(ffe_filtered<200))>=length(ffe_filtered(find(ffe_filtered>=210 & ffe_filtered<420)))
    disp('Boy')
    frequency=mean(ffe_filtered(find(ffe_filtered>60 & ffe_filtered <250)));
else
    disp('gril')
    frequency=mean(ffe_filtered(find(ffe_filtered>180 & ffe_filtered<440)));
end
disp(['Frequency:',num2str(frequency)]);


% ��ffe����ƽ������


% ����Ƶ��ͼ
% figure();
% X_fft=abs(fft(X));
% f=(0:wlen-1)/wlen*Fs;
% plot(f(1:fix(wlen/2)),X_fft(1:fix(wlen/2),speak_index(1)));
% plot(length(ffe(2)),ffe(2))
% p=y_cepstrum_speak(:,3);
% plot((1:fix(Fs/600))*Ts,p(1:fix(Fs/600)));

% plot(y_cepstrum_speak)
