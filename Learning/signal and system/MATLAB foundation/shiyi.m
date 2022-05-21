subplot(2,2,1)
t=[-3:7];
y=[0 0 0 2 0 1 -1 3 0 0 0 ];
stem(t,y);
axis([-5 10 -1 3]);



%y=x(n-2)
subplot(2,2,2);
t=t+2;
stem(t,y);
axis([-5 10 -1 3]);

%y=x(n+1)
subplot(2,2,3);
t=t-1;
stem(t,y);
axis([-5 10 -1 3]);

%y=x(-n)
subplot(2,2,4);
t=-t;
stem(t,y);
axis([-5 10 -1 3]);