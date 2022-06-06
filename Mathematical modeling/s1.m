function f=s1(x)
T=[];
for i=1:10
    T(i)=x(i,4,1)+x(i,4,2);
end
f=max(T);
end

