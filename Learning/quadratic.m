function [x1,x2]=quadratic(a,b,c)


%�˺������ض��η��̵ĸ�������Ҫ��������
%����һ��������
d= disc(a,b,c);
x1=(-b+d)/(2*a);
x2=(-b-d)/(2*a);

end
%�������


%��ʼ�������б�ʽ
function d=disc(a,b,c)

d=sqrt(b^2-4*a*c);

end