x=linspace(0,2*pi,40);x_m=x;
x_m([11:13,28:30])=NaN;y_m=sin(x_m);
plot(x_m,y_m,'ro','MarkerFaceColor','r');
xlim([0,2*pi]);ylim([-1.2,1.2]);box on;
set(gca,'fontsize',16,'xtick',0:pi/2:2*pi,'xticklabel',{'0','\pi/2','3\pi/2','2\pi'});
%title('\pi')
%%
m_i=~isnan(x_m);
y_i=interp1(x_m(m_i),y_m(m_i),x);
hold on
plot(x,y_i,'-b','linewidth',2);
hold off;
%%
figure
m_i=~isnan(x_m);
y_i=spline(x_m(m_i),y_m(m_i),x);
hold on;plot(x,y_i,'-g','linewidth',2);hold off;
h=legend('orginal','spline');
