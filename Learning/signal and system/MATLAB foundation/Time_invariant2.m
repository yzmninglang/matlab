%说明时变系统

syms n;
y=cos(pi/8*n)*sin(pi/16*n);
y1=subs(y,n-2);
y2=y;

subplot(3,1,1);
x=0:20;
y=subs(y,x);
stem(x,y,'linewidth',1.5);
title('Origin Function');



subplot(3,1,2);
y1=subs(y1,x);
stem(x,y1,'linewidth',1.5);
title('Time_invariant First');

subplot(3,1,3);
x=x-2;
stem(x,y,'linewidth',1.5);
title('System Transfrom First');