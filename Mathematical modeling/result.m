function [ f ] = result(x)
t=1
for i=1:10:
    for j=1:4:
        t=t*x(i,j);
    end
end
f=t;
end

