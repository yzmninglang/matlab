tic
mu= csvread('C:\Users\ninglang\Desktop\mu.csv')
sigma=csvread('C:\Users\ninglang\Desktop\sigma.csv')
t=[13.28 14.96 19.85 20.01;
	 9.87	19.91	17.93	18.94;
	20.06	15.97	14.97	15.12;
	 7.99  9.94	 5.94	18.13;
	 8.77 13.72	13.01	11.25;
	19.07 20.09 14.15 13.88;
	11.16 16.50 12.01 19.09;
	16.02	 8.83 18.11 16.83;
	15.01	12.04 7.04 8.95;
	12.95	 7.01  9.05	16.05]

t=optimvar('t',10,4,'LowerBound',0);
x=optimvar('x',10,4,'LowerBound',0);
G=optimvar('x',10,4);
y=optimva('y',r10,10,'type','integer','LowerBound',0,'upperBound',1);
T=optimvar('T');
prob=optimproblem;
prob.Objective=prod(prod(G));
con10=optimconstr(40);
k6=0;
for i=1:10
    for j=1:4
        k6=k6+1;
        con10(k6)=G(i,j)=normcdf(x(i,j),[sigma(i,j) mu(i,j)]);
    end
end
prob.Constraints.conl=x(:,4)+t(:,4)<=184.7787*0.95;
con2=optimconstr(30);con3=optimconstr(360);
k1=0;k2=0;
for i=1:10
    for j=1:3
        k1=k1+1;con2(k1)=x(i,j)+t(i,j)<=x(i,j+1);
    end
end
prob.Constraints.con2=con2;
for i=1:9
    for j=1:4
        for k=i+1:10
            k2=k2+1;
            con3(2*k2-1)=x(i,j)+t(i,j)<=x(k,j)+10000*(1-y(i,k));
            con3(2*k2)=x(k,j)+t(k,j)<=x(i,j)+10000*y(i,k);
        end
    end
end
prob.Constraints.con3=con3;
[sol,fval,flag,out]=solve(prob)
xx=sol.x,yy=sol.y
toc
