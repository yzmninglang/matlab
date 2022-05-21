%????
clear;
t0=0;tf=5;dt=0.05;t1=1;
t=[t0:dt:tf];st=length(t);
n1=floor((t1-t0)/dt);
x1=zeros(1,st);x1(n1+1)=1/dt;
stairs(t,x1);grid on;
axis([0 5 0 25]);
xlabel('t');
ylabel('\delta(t-t_1)');