function [audio ,Fs] = jiangzao(file,handles)
    % disp(file);
    [x ,fs]=audioread(file);

    axes(handles.axes5);
    time=(0:(length(x)-1))/fs;
    plot(time,x);
    axis([0 max(time) -1 1]);
    set(get(gca, 'YLabel'), 'String', '����');
    set(get(gca, 'XLabel'), 'String', 'T/s');
    t=title('ԭ�ź�ʱ��');
    t.FontSize=14;

    audio_fft=abs(fft(x));
    axes(handles.axes6);
    f=(0:(length(x)-1))*fs/length(x);
    plot(f(1:fix(length(x)/2)),audio_fft(1:fix(length(x)/2)));

    t=title('ԭ�ź�Ƶ�����������');
    t.FontSize=14;
    set(get(gca, 'YLabel'), 'String', '����/dB');
    set(get(gca, 'XLabel'), 'String', 'Ƶ��/Hz');

    sound(x,fs);
    x=x(:,1);
    y=v_specsub(x,fs);
    audio=y;
    Fs=fs;

    axes(handles.axes7);
    time=(0:(length(x)-1))/fs;
    plot(time,y);
    axis([0 max(time) -1 1]);
    set(get(gca, 'YLabel'), 'String', 'ʱ����');
    set(get(gca, 'XLabel'), 'String', 'T/s');
    t=title('ȥ��֮��ʱ����');
    t.FontSize=14;
    
    audiowrite('qq1.wav',y,Fs);
    
    
    % figure();
    % subplot(3,1,1);
    % x=y;
    % audio_fft=abs(fft(x));
    % %axes(handles.axes6);
    % f=(0:(length(x)-1))*fs/length(x);
    % plot(f(1:fix(length(x)/2)),audio_fft(1:fix(length(x)/2)));

    % set(get(gca, 'Title'), 'String', '�����ź�Ƶ�����������');
    % set(get(gca, 'YLabel'), 'String', '����/dB');
    % set(get(gca, 'XLabel'), 'String', 'Ƶ��/Hz');
    % disp(size(audio_fft));
    % f=(0:(length(y)-1))*fs/length(y);
    % plot(f(1:fix(length(y)/2)),audio_fft(1:fix(length(y)/2)));

end