%% ??????
% ????
function f = fun3(x)
    f = prod(p(x),'all');
end

function f = p(x)
    load('data.mat');
    u = data(1);
    a = data(2);
    for i = 1:3
        for j = 1:10
            g = @(x) (1 / (a(i,j) * sqrt(2 * pi))) * exp((x(i,j)-u(i,j)).^2/(2 * a(i,j) ^ 2));
            t = t_f(x);
            q = integral(g,0,t(i,j));
        end
    end
    f = q;
end

function f = t_f(x)
     t = zeros(4,10);
    for i = 1:3
        for j = 1:10
            t(i,j) = x(i+1,j) - x(i,j);
        end
    end
    f = t;
end