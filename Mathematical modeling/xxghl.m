%% xxgh
f=[6 3 4];
A=[1 2 -3 ];b=80;
Aeq=[1 1 1 ];beq=120;
xl=[30 0 20];xu=[inf 50 inf];
[x,z]=linprog(f,A,b,Aeq,beq,xl,xu);

%% next
f=[0.4 0.28 0.32 0.72 0.64 0.6];
A=[0.01 0.01 0.01 0.03 0.03 0.03;0.02 0 0 0.05 0 0;0 0.02 0 0 0.05 0;0 0 0.03 0 0 0.08];
b=[850 700 100 900];
xl=[0 0 0 0 0 0 ];
[x,z]=linprog(f,A,b,[],[],xl,[]);

