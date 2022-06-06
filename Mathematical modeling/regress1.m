load carsmall
y=MPG;
X1=Weight;X2=Horsepower;
X=[ones(length(X1),1) X1 X2];
b=regress(y,X);
x1fit=min(X1):100:max(X1);
x2fit=min(X2):10:max(X2);
[X1fit,X2fit]=meshgrid(x1fit,x2fit);
Y=b(1)+b(2)*X1fit+b(3)*X2fit;
figure
hold on
scatter3(X1,X2,y,'filled');
mesh(X1fit,X2fit,Y);
hold off
xlabel('Weight');
ylabel('Horsepower');
zlabel('MPG');


    
    
    