[mtlb,Fs]=audioread('./example.wav');%读取声音文件



% x---输入信号的向量。默认情况下，即没有后续输入参数，x将被分成8段分别做变换处理，
% 如果x不能被平分成8段，则会做截断处理。默认情况下，其他参数的默认值为
% window---窗函数，默认为nfft长度的海明窗Hamming
% noverlap---每一段的重叠样本数，默认值是在各段之间产生50%的重叠
% nfft---做FFT变换的长度，默认为256和大于每段长度的最小2次幂之间的最大值。
% 另外，此参数除了使用一个常量外，还可以指定一个频率向量F
% fs---采样频率，默认值归一化频率

mtlb=mtlb(:,1);
segmentlen = 9000;
noverlap = 450;
NFFT = 3000;

spectrogram(mtlb,segmentlen,noverlap,NFFT,Fs,'yaxis')
dt = 1/Fs;
I0 = round(1.5/dt);
Iend = round(1.7/dt);
x = mtlb(I0:Iend);
c = cceps(x);
t = 0:dt:length(x)*dt-dt;

trng = t(t>=2e-3 & t<=12e-3);
crng = c(t>=2e-3 & t<=12e-3);

[~,I] = max(crng);
figure();
fprintf('Complex cepstrum F0 estimate is %3.2f Hz.\n',1/trng(I))
plot(trng*1e3,crng)
xlabel('ms')

hold on
plot(trng(I)*1e3,crng(I),'o')
hold off

[b0,a0] = butter(2,325/(Fs/2));
xin = abs(x);
xin = filter(b0,a0,xin);
xin = xin-mean(xin);
zc = zerocross(xin,0.0001);
F0 = 0.5*Fs*zc;
fprintf('Zero-crossing F0 estimate is %3.2f Hz.\n',F0)