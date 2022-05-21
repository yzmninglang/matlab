syms w t t0
x1=sin(w*t).*heaviside(t);
x2=sin(w*(t-t0)).*heaviside(t);
x3=sin(w*t).*heaviside(t-t0);
x4=sin(w*(t-t0)).*heaviside(t-t0);
x1=subs(x1,w,10);
x2=subs(x2,w,10);
x2=subs(x2,t0,1);
x3=subs(x3,w,10);
x3=subs(x3,t0,1);
x4=subs(x4,w,10);
x4=subs(x4,t0,1);


subplot(2,2,1);
ezplot(x1,[-4 4]);
axis([-4 4 -1.1 1.1]);


subplot(2,2,2);
ezplot(x2,[-4 4]);
axis([-4 4 -1.1 1.1]);


subplot(2,2,3);
ezplot(x3,[-4 4]);
axis([-4 4 -1.1 1.1]);


subplot(2,2,4);
ezplot(x4,[-4 4]);
axis([-4 4 -1.1 1.1]);