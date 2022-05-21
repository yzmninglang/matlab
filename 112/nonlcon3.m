%% ???????????
% ???????
function [c,ceq]=nonlcon3(x)
global t_n;  
for j = 1:10
        for k = 1:10
            for i = 1:3
                if x(i,j) > x(i,k) + t(i,k)
                    x(i,j) =  x(i,k) + t(i,k) + x(i,k+10);
                end
            end
        end
end
    c(1) = -x(i,k);
    
    c(2) = T - t_n;
    
    ceq = [];
end

function f = t(x)
    for i = 1:3
        for j = 1:10
            t(i,j) = x(i+1,j) - x(i,j);
        end
    end
    f = t;
end

function f = T(x)
    for i = 1:4
        for j = 1:10
            z = x(i,j) + t(i,j);
        end
    end
    f = max(z,[],'all');
end