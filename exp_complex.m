%exm 5_13_complex.m


%画出x的实部和t的关系
clear;
t0=0;tf=5;
dt=0.05;
t=[t0:dt:tf];
alpha=-0.5;w=10;
x=exp((alpha+j*w)*t);
subplot(2,2,1);plot(t,real(x));
grid on;
xlabel('t');
ylabel('Real Part');


%画出x的虚部和t的关系
subplot(2,2,2);
plot(t,imag(x));
grid on;
xlabel('t');
ylabel('Image Part');


%画出x的模和t的关系
subplot(2,2,3);
plot(t,abs(x));
xlabel('t');
ylabel('abs(x)');
grid on;


%画出x的相位和t的关系
subplot(2,2,4);
plot(t,angle(x));
xlabel('t');
ylabel('angle');
grid on;


