%6-3


%�����������ߵ�ϵ��
a=[1 7 10];
b=[1 6 4];

%�õ�ϵͳ��ģ��
sys=tf(b,a);



%���������ź�e(t)=4u(t)
t=0:0.5:8;
x=ones(1,length(t))*4;


%ʹ��lsim����4u��t���ź�
subplot(3,1,1);
s=lsim(sys,x,t);
plot(t,s,'ro:');
title('4u(t)');
xlabel('time');

%ʹ��impulse�����ź�
subplot(3,1,2);
impulse(sys);


%ʹ��step�����Ծ�ź�
subplot(3,1,3);
step(sys);

