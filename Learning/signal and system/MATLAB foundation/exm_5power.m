%exm5_5_power.m
n=0:10;
x1 = power(1.1,n);
subplot(2,2,1);stem(n,x1);legend('a=1.1');

x2=power(-1.1,n);
subplot(2,2,2);stem(n,x2);legend('a=-1.1');

x3=power(2.2,n);
subplot(2,2,3);stem(n,x3);legend('a=2.2');

x3=power(-2.2,n);
subplot(2,2,4);stem(n,x3);legend('a=-2.2');