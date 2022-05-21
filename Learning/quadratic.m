function [x1,x2]=quadratic(a,b,c)


%此函数返回二次方程的根，它需要三个参数
%这是一个主函数
d= disc(a,b,c);
x1=(-b+d)/(2*a);
x2=(-b-d)/(2*a);

end
%求根结束


%开始构建求判别式
function d=disc(a,b,c)

d=sqrt(b^2-4*a*c);

end