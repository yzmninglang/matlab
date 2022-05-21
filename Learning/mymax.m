%这个函数只有一个返回值max，如果有多个返回值，这需要有
%数组


function max =mymax(n1,n2,n3)


%此函数用于计算
%输入五个数字
max = n1;
if(n2>max)
    max=n2;
end
if(n3>max)
    max=n3;
end
