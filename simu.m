n=1829;%???
alpha=0.98; %??????
k=1000; %????????????
for t=1:n
    T=1000;
    T_min=1e-6;
    while(T>T_min)
        for I=1:k%????
            fx(t)=Fx(x(:,t));
            for i=1:5
              x_new(i,t)=x(i,t)+getX;
            end
            if(x_new(1,t)<=1 && x_new(2,t)<=1 && x_new(3,t)<=1 &&...
                x_new(4,t)<=1 &&x_new(5,t)<=1 && x_new(1,t)>=0 &&...
                x_new(2,t)>=0 && x_new(3,t)>=0 &&x_new(4,t)>=0 &&...
                x_new(5,t)>=0 )
                fx_new(t)=Fx(x_new(:,t));
                delta=abs(fx_new(t)-setfx(t));
                if (delta<0)
                    x(:,t)=x_new(:,t);
                else
                    P=getP(delta,T);
                    if(P>rand)
                        x(:,t)=x_new(:,t);
                    end
                end
            end
            T=T*alpha;
        end
    end%??????
end%??????
