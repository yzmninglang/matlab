figure
x=-3:3;y=[-1 -1 -1 0 1 1 1];t=-3:.01:3;
s=spline(x,y,t);p=pchip(x,y,t);
hold on ; plot(t,s,':g','linewidth',2);
plot(t,p,'--b','linewidth',2);plot(x,y,'ro','markerfacecolor','r');
hold off;box on ;set(gca,'fontsize',16);
h=legend('original','spline','hermite','location','northwest');