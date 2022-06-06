m=0.1;
for i=1:1:10
    x=pi/2;

    y=diff([sin(x) sin(x+m)]);
    disp(num2str(y/m));
    m=m*0.1;
end
    