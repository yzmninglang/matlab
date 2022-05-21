% syms t;
subplot(2,2,1);
t=[-1:0.01:5];
x=t.*(heaviside(t)-heaviside(t-1));
plot(t,x);
axis([-3 7 0 3]);
 

%»­³öt*u£¨t£©
 subplot(2,2,2);
t=[-1:0.01:5];
x=t.*heaviside(t-1);
plot(t,x);
axis([0 3 0 3]);


%»­³öt(u(t)-u(t))+u(t)
subplot(2,2,3);
t=[-1:0.01:5];
x=t.*(heaviside(t)-heaviside(t-1))+heaviside(t-1);
plot(t,x);
axis([-1 5 0 3]);


%»­³ö(t-1)*u(t)
subplot(2,2,4);
t=[-1:0.01:5];
x=(t-1).*heaviside(t-1);
plot(t,x);
axis([0 3 0 3]);


