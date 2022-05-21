%exm15_unit_step

clear;
t0=0;tf=5;dt=0.05;t1=3;
t= [t0:dt:tf];
st=length(t);
n1=floor((t1-t0)/dt);
x2=[zeros(1,n1) , ones(1,st-n1)];
stairs(t,x2);grid on;
axis([0 5 0 1.5]);
xlabel('t');
ylabel('u(t-t_1)');
