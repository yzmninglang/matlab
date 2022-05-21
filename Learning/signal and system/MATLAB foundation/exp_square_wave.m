%观察方波的吉博思现象
t=0:0.01:2*pi;
%N为最大谐波次数

N=21;

%这里的y是一个矩阵，可以储存(N+1)/2行的数据，每一行有length(t)列，
%其实是对应的这个的(N+1)/2钟情况
y=zeros((N+1)/2,length(t));
x=zeros(size(t));


%这个循环用来生成(n+1)/2行y的值，
%n=1时，可以生成sin(t)放入x中，再放入y中
%n=3时，可以生成sin(t)+1/3sin(3t)放入y中
for n=1:2:N 
    x=x+sin(n*t)/n;
    y((n+1)/2,:)=x;
end

y=y*4/pi;

%绘制第一幅图
figure(1);
plot(t,y);
xlabel('t');
ylabel('y_n(t)');
grid on;

%绘制(0,1)-->(pi+0.5,1)的直线段
line([0,pi+0.5],[1,1]);
text(pi+0.5,1,'1');

%绘制一幅3D图
figure(2);
halft=ceil(length(t)/2);
mesh(t(1:halft),[1:2:N],y(:,1:halft));
xlabel('t');
ylabel('n');
zlabel('y_n(t)');

%吉布斯现象的最大值一定出现在最后一行的某一个里面
gibbs=(max(y(N+1)/2,:)-1)/2;


