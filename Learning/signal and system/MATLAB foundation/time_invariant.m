
syms e n;
y=e+2;

y1=subs(y,sin(pi*n/16));
y2=subs(y,sin(pi*n/8));
y12=subs(y,sin(pi*n/16)+sin(pi*n/8));
t=[-1:30];
y1=subs(y1,t);
y2=subs(y2,t);
y12=subs(y12,t);
subplot(4,1,1);
stem(t,y1);
axis([-2 32 0 4]);
subplot(4,1,2);
stem(t,y2);
axis([-2 32 0 4]);


subplot(4,1,3);
stem(t,y1+y2);
axis([-2 32 0 10]);


subplot(4,1,4);
stem(t,y12);
axis([-2 32 0 4]);