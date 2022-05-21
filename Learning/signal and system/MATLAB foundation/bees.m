clc;close all;clear;

f1=262;
%采样率
fs=8192;

%中音2,3,4,5的频率
f2=f1*power(2,2/12);f3=f1*power(2,4/12);
f4=f1*power(2,5/12);f5=f1*power(2,7/12);
N_zeros=300;

%产生四分之一的音符 1s
n=0:(fs/2-N_zeros-1);
x1=[sin(n*2*pi*f1/fs) zeros(1,N_zeros)];
x2=[sin(n*2*pi*f2/fs) zeros(1,N_zeros)];
x3=[sin(n*2*pi*f3/fs) zeros(1,N_zeros)];
x4=[sin(n*2*pi*f4/fs) zeros(1,N_zeros)];
x5=[sin(n*2*pi*f5/fs) zeros(1,N_zeros)];

%产生八分之一的音符 0.5s
n=0:(fs/2-N_zeros-1);
xh1=[sin(n*2*pi*f1/fs) zeros(1,N_zeros)];
xh2=[sin(n*2*pi*f2/fs) zeros(1,N_zeros)];
xh3=[sin(n*2*pi*f3/fs) zeros(1,N_zeros)];
xh4=[sin(n*2*pi*f4/fs) zeros(1,N_zeros)];
xh5=[sin(n*2*pi*f5/fs) zeros(1,N_zeros)];

n=0:(2*fs-N_zeros-1);
x_1=[sin(n*2*pi*f1/fs) zeros(1,N_zeros)];
x_3=[sin(n*2*pi*f3/fs) zeros(1,N_zeros)];


notes=[xh5 xh3 x3 xh4 xh2 x2 xh1 xh2 xh3 xh4 xh5 xh5 xh5 x5];
notes=[notes xh5 xh3 x3 xh4 xh2 x2 xh1 xh3 xh5 xh5 x_3];
notes=[notes xh5 xh3 x3 xh4 xh2 x2 xh1 xh3 xh5 xh5 x_1];


sound(notes,fs);

