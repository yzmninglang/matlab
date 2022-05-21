%傅里叶级数
%一项傅里叶级数
t=0:0.01:2*pi;
y=sin(t);
y=y*4/pi;
plot(t,y);
pause(0.5);


%保留一次和三次谐波分量
y=sin(t)+1/3*sin(3*t);y=y*4/pi;
plot(t,y);
pause(0.5);


%保留一次、三次、五次、七次、九次谐波分量
y=sin(t)+1/3*sin(3*t)+1/5*sin(5*t)+sin(7*t)/7+sin(9*t)/9;
y=y*4/pi;
plot(t,y);
