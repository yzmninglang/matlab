%˵��ʱ��ϵͳ
n=0:40;

x= sin(pi*n/16);
y=decimation_2(x);

ny =0:length(y)-1;
ny=ny-3;


x2=sin(pi/16*(n-3));
y2=decimation_2(x2);

subplot(3,1,1);
stem(n,x);
title('ԭ�ź�');


subplot(3,1,2);
stem(ny,y);
title('�Ⱦ���ϵͳ����ʱ��ƽ��');



subplot(3,1,3);
stem([0:length(y2)-1],y2);
title('��ʱ��ƽ��,�Ⱦ���ϵͳ');


