%��һ�����ú���Ƕ��ʵ�ֵ�
%�����ʽ
function [r1,r2]=quadratic1(a,b,c)

    function d=disc(a,b,c)
        
        d=sqrt(b*b-4*a*c);
    end

    d=disc(a,b,c);
    r1=(-b+d)/(2*a);
    r2=(-b-d)/(2*a);


end