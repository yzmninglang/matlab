function F=fib_zdxs(n)
    FF=ones(1,n)
    if n<2
        F=1
    else
        for i=3:n
            FF(i)=FF(i-1)+FF(i-2);
        end
        F=FF(n)
    end
end
