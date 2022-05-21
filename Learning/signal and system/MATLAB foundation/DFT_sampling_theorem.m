clear all;
% matlab验证采样定理

%该程序用于画出原信号的图形以及其DFT图形


t = -0.1:0.001:0.1;%该参数用于画原信号图形

k = 0:200;%时域取样

n = -999:0;%频域取样

% 这里还不算抽样
f = sin(2*pi*60*t)+cos(2*pi*25*t);
% 算出
s = exp(-j*2*pi/length(k));

skn = s.^(k'*n);%代公式

F = f*skn;%对原函数进行傅里叶变换,

%此处f是1*201的矩阵，则skn必须满足201*X的矩阵

%得到的f是1*X的矩阵

subplot(2,1,1)

plot(t, f);%画出采原函数序列图

title('原信号');

xlabel('时间t(s)');

j = 1:length(F);

subplot(2,1,2)

plot(j,abs(F),'r')%画出序列的DFT图

title('原信号的DFT图');
