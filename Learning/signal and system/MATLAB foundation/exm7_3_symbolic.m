% 用指数傅里叶级数来逼近函数

clear all;
syms t T X1 X_1 X3 X_3

% 构建函数，详细请见尹老师书中p132
x=X_1*exp(-1i*2*pi/T*t)+X1*exp(1i*2*pi/T*t)+X3*exp(-1i*3*2*pi/T*t)+X3*exp(1i*3*2*pi/T*t);

T=1;X1=5;X_1=5;X3=3;X_3=3;
t=0:0.01:2;
% SUBS(S) replaces all the variables in 
% the symbolic expression S with  values obtained from the calling function,
x=subs(x);

plot(t,x)

% ezplot不能传递两个序列，一个必须是未知数的形式，也就是syms的形式
% ezplot(x,t);


