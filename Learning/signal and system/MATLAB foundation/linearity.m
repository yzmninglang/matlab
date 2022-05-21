%exm6 linearity.m
n=0:0.1:30;
x1=sin(pi*n/4);
x2=sin(pi*n/8);


y1=x1.^2;
y2=x2.^2;
y12=y1+y2;

y21=(y1+y2).^2;
subplot(4,1,1);

plot(n,y1);
xlabel('t');
ylabel('sin(pi*n/4)^2')


subplot(4,1,2);

plot(n,y2);
xlabel('t');
ylabel('sin(pi*n/8)^2')


subplot(4,1,3);

plot(n,y12);
xlabel('t');
ylabel('sin(pi*n/4)^2+sin(pi*n/8)^2')
subplot(4,1,4);
plot(n,y21);
xlabel('t');
ylabel('(sin(pi*n/4)+sin(pi*n/8))^2')


