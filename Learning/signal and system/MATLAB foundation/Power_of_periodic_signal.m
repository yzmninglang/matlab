% cos函数经过限幅器

clear all;

syms t y T n



%用积分求出Fn
Yn=int(exp(-1i*n*(2*pi/T)*t)/T,'-T/4','T/4')-int(exp(-1i*n*(2*pi/T)*t)/T,'T/4','3*T/4');

%直流单独处理
n=-10:-1;
Yn_left=subs(Yn);
n=1:10;
Yn_right=subs(Yn);


%得到Yn的数值
YN=[Yn_left 0 Yn_right];
%画一下幅度谱
subplot(1,2,1);
h=stem(-10:10,abs(YN));
set(h,'lineWidth',2);
axis([-11 11 0 1])

subplot(1,2,2);
h=stem(-10:10,YN.^2);
set(h,'lineWidth',2);
axis([-11 11 0 1])


%计算平均功率
n1_power=sum(YN(10:12).^2);


% 利用帕赛瓦尔定理计算
n=-99:-1;
Yn_left=double(subs(Yn));
n=1:99;
Yn_right=double(subs(Yn));

YN=[Yn_left 0 Yn_right];
PN=sum(YN.^2);


% 计算有限项级数的功率综合
P_n=YN(100:199).^2*2;
Pcum=cumsum(P_n);
figure;
stem(0:99,Pcum);
set(get(gca, 'XLabel'), 'String', 'x');
set(get(gca, 'YLabel'), 'String', 'Pcum');  