% out=VideoWriter('./sin_.gif');
% out.FrameRate=10;
% open(out)
% % 循环画图
% x=0:1e-4*pi:4*pi;
% figure();
% for i=1:100
%     % 设置一个延迟
%     delay=i*2*pi/100;
%     y=sin(x+delay);
%     plot(x,y);
%     F=getframe(gcf);
%     writeVideo(out,F);
%     clf;

% end
% close(out);



clc
clear
pic_num = 1;
for delay
    plot(fig(i));
    F=getframe(gcf);
    I=frame2im(F);
    [I,map]=rgb2ind(I,256);

    if pic_num == 1
    imwrite(I,map,'test.gif','gif','Loopcount',inf,'DelayTime',0.2);

    else
    imwrite(I,map,'test.gif','gif','WriteMode','append','DelayTime',0.2);

    end

    pic_num = pic_num + 1;

end