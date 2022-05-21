w=[0.1,0.1,0.15,0.3,0.35];
R1=[0.2,0.5,0.2,0.1];
R2=[0.1,0.3,0.5,0.1];
R3=[0.1,0.1,0.5,0.3];
R4=[0,0.4,0.5,0.1];
R5=[0.5,0.3,0.2,0];
R=[R1;R2;R3;R4;R5];
a=zeros(1,size(R,2));
R6=zeros(size(R,1),size(R,2));

%M(^,v) Arithmetic
% for j =1:size(R,2)
%     for i = 1:size(R,1)-1
%         R6(i,j)=min(R(i,j),w(i));
%     end
%     a(j)=max(R6(:,j));
% end
a1=zeros(1,size(R,2));
%M(.,+) Arithmetic

a=w*R;
%L2——normalize
a1=a(1,:)/norm(a(1,:));

