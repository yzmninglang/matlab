%exm6_3_lsim.m



%���������ź�
t=0:0.5:8;
x=ones(1,length(t));


%LTIϵͳ��ϵ������
a=[1 4 3];
b=[1 2];


%ʹ�ô��ݺ�������ϵͳģ��
sys=tf(b,a);


%������
y2=2/3-exp(-t)/2-exp(-3*t)/6;

h=plot(t,y2,'b');
hold on;
set(h,'LineWidth',2);


%ʹ��Lsim����Ӧ
s=lsim(sys,x,t);
plot(t,s,'ro:');
xlabel('t');ylabel('��λ��Ծ��Ӧ:');
legend('������','������');
