%说明时变系统
n=0:40;

x= sin(pi*n/16);
y=decimation_2(x);

ny =0:length(y)-1;
ny=ny-3;


x2=sin(pi/16*(n-3));
y2=decimation_2(x2);

subplot(3,1,1);
stem(n,x);
title('原信号');


subplot(3,1,2);
stem(ny,y);
title('先经过系统，再时间平移');



subplot(3,1,3);
stem([0:length(y2)-1],y2);
title('再时间平移,先经过系统');


