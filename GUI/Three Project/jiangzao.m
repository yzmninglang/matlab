function [audio ,Fs] = jiangzao(file)
    disp(file);
    [x ,fs]=audioread(file);
    sound(x,fs);
    x=x(:,1);
    y=v_specsub(x,fs);
    audio=y;
    Fs=fs;
end