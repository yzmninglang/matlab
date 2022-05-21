%exm5_15 sys.m
syms t a w;
x= exp(-a*t)*cos(w*t)*heaviside(t);
x1=subs(x,a,1);
x2=subs(x1,w,10);
ezplot(x2,[0:2*pi]);
axis([0 2*pi -1 1]);