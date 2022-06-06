A=[0 -6 -1 ;6 2 -16;-5 20 -10];
x0=[1 1 1]';X=[];
for t=0:0.01:1
    X=[X expm(t*A)*x0];
end
plot3(X(1,:),X(2,:),X(3,:),'-o');
xlabel('X_1');ylabel('X_2');zlabel('X_3');grid on;
axis tight square;