
V0 = rand([7,2000]);
W = rand([1,7]);
T = rand([1,2000]);

x0 = zeros(size(V0));
V = fminimax(@fun,x0,[],[],[],[],[],[],@nonlcon);

function f = fun(x)
    f(1) = sum(n(x));
    f(2) = sum(x,'all');
    f(3) = s(x);
end


function f = n(x)
    a = sum(x,1);
    for i = 1:size(a)
        if a(i) > 0
            b(i) = 1;
        else
            b(i) = 0;
        end
    end
    f = b;
end


function f = tem(x)
    for i = 1:size(T)
        t_v(i) = W .* x(:,i);
        t(i) = T(i) + v_t(i);
    end
    f = t;
end


function f = s(x)
    t_m = mean(tem(x));
    f = var(tem(x) - t_m);
end


function [c,ceq] = nonlcon(x)
    c = tem(x) - 455;
    ceq = [];
end
