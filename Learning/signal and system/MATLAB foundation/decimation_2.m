function y=decimation_2(x)
%¿Î…¢–≈∫≈≥È—˘
    n=length(x);
    if mod(n,2)==1
        n=n+1;
        x=[x 0];
    end
    N=floor(n/2);
    for ii=1:N
        y(ii)=x(2*ii-1);
    end

end