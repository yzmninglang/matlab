function output = jiangzao(signal,wlen,inc,NIS,a,b)  
%myFun - Description
%
% Syntax: output = myFun(input)
%
% Long description
    
    wnd=hamming(wlen);
    N=length(signal);
    y=enframe(signal,wnd,inc)'; %分帧
    fn=size(y,2);


    % 求FFT
    y_fft=fft(y);
    y_a=abs(y_fft);

    y_phase=angle(y_fft);
    y_a2=y_a.^2;
    Nt=mean(y_a2(:,1:NIS),2);
    nl2=wlen/2+1;

    for i=1:fn
        for k=1:nl2
            if y_a2(k,i)>a*Nt(k)
                temp(k)=y_a2(k,i)-a*Nt(k);
            else
                temp(k)=b*y_a2(k,i);
            end
            U(k)=sqrt(temp(k));
        end
        X(:,i)=U;
    end;
    output=hechengzhen(X,y_phase(1:nl2,:),wlen,inc,N);
    Nout=length(output);
    if Nout>N 
        output=output(1:N);
    elseif Ncout<N 
        output=[output;zeros(N-Ncout,1)];
    end
    output=output/max(output);   %幅度归一化
end
