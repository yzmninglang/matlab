% function output=hechengzhen(X,y_phase,wlen,inc,N)
    % inc�ǲ���
    % wlen��һ֡�ĳ���
    % N�����Ϊ�೤
    

    % spectral=X.*exp(j*y_phase);
    % enhanced=real(iff(spectral));
    % output=zeros(1,N);
    wlen=20;
    inc=10;
    win=hamming(wlen);
    audio=audioread('gril2.wav');
    enhanced=enframe(audio,win,inc)';
    output=zeros(1,length(audio));
    for n=1:N 
        if floor(n/inc)==0
            output(n)=enhanced(n,floor(n/inc)+1);
        elseif floor(n/inc)==size(enhanced,2)
            output(n)=enhanced(n-floor(n/inc)*inc+1,floor(n/inc));
        else
            output(n)=enhanced(n-floor(n/inc)*inc+1,floor(n/inc)) +enhanced(n-(floor(n/inc)-1)*inc+1,floor(n/inc)-1);
        end
    end


