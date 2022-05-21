%离散卷积练习2

nx=0:3;
x=ones(1,length(nx));


nh=0:9;
h=0.8.^nh.*ones(1,length(nh));

subplot(3,1,1);
stem(nx,x);
axis([min(nx) max(nx) 0 max(x)]);

subplot(3,1,2);
stem(nh,h);
axis([min(nh) max(nh) 0 max(h)]);

ny=(min(nx)+min(nh)):(max(nx)+max(nh));
y=conv(x,h);

subplot(3,1,3);
stem(ny,y);