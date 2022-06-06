% 加窗


% 什么是窗
windows=hamming(61);
subplot(2,1,1);
plot((0:length(windows)-1),windows);
% hamming窗的频域特性是怎么样的
subplot(2,1,2);
w2=fft(windows,1024);
w3=w2/w2(1);
w4=20*log10(abs(w3));
w=2*(0:1023)/1024;
plot(w(1:512),w4(1:512));


