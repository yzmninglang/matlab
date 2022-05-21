%exm 5_13_complex.m


%����x��ʵ����t�Ĺ�ϵ
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


%����x���鲿��t�Ĺ�ϵ
subplot(2,2,2);
plot(t,imag(x));
grid on;
xlabel('t');
ylabel('Image Part');


%����x��ģ��t�Ĺ�ϵ
subplot(2,2,3);
plot(t,abs(x));
xlabel('t');
ylabel('abs(x)');
grid on;


%����x����λ��t�Ĺ�ϵ
subplot(2,2,4);
plot(t,angle(x));
xlabel('t');
ylabel('angle');
grid on;


