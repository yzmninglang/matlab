%f(t)=[u(t+2)-u(t)] 

syms t;
f=heaviside(t+2)-heaviside(t)+(1-t)*(heaviside(t)-heaviside(t-1));
f1=subs(f,-3*t-2);
subplot(2,1,1);
ezplot(f,[-1 4]);


subplot(2,1,2);
ezplot(f1,[-2 4]);
