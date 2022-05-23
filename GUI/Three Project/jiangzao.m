function [audio ,Fs] = jiangzao(file,handles)
    % disp(file);
    [x ,fs]=audioread(file);

    axes(handles.axes5);
    time=(0:(length(x)-1))/fs;
    plot(time,x);
    axis([0 max(time) -1 1]);
    set(get(gca, 'YLabel'), 'String', '幅度');
    title('原信号时域')

    audio_fft=abs(fft(x));
    axes(handles.axes6);
    f=(0:(length(x)-1))*fs/length(x);
    plot(f(1:fix(length(x)/2)),audio_fft(1:fix(length(x)/2)));

    set(get(gca, 'Title'), 'String', '原信号频域对数功率谱');
    set(get(gca, 'YLabel'), 'String', '功率/dB');
    set(get(gca, 'XLabel'), 'String', '频率/Hz');

    sound(x,fs);
    x=x(:,1);
    y=v_specsub(x,fs);
    audio=y;
    Fs=fs;

    axes(handles.axes7);
    time=(0:(length(x)-1))/fs;
    plot(time,y);
    axis([0 max(time) -1 1]);
    set(get(gca, 'YLabel'), 'String', '时域波形');
    title('去噪之后时域波形');
    
    audiowrite('qq1.wav',y,Fs);
    
    
    % figure();
    % subplot(3,1,1);
    % x=y;
    % audio_fft=abs(fft(x));
    % %axes(handles.axes6);
    % f=(0:(length(x)-1))*fs/length(x);
    % plot(f(1:fix(length(x)/2)),audio_fft(1:fix(length(x)/2)));

    % set(get(gca, 'Title'), 'String', '降噪信号频域对数功率谱');
    % set(get(gca, 'YLabel'), 'String', '功率/dB');
    % set(get(gca, 'XLabel'), 'String', '频率/Hz');
    % disp(size(audio_fft));
    % f=(0:(length(y)-1))*fs/length(y);
    % plot(f(1:fix(length(y)/2)),audio_fft(1:fix(length(y)/2)));

end