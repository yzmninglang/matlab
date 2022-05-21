%exm5_14.m
t=linspace(-10,10,101);
x=sinc(t/pi);
plot(t,x);
grid on;
xlabel('x');
ylabel('Sa(x)')