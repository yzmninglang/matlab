%exm5_4_multiple.m


n=0:5;
x=n;
%????
y=[ x  x x];
ny = 0:length(y)-1;
z=[x 0 0 0 x 0 0 0 x 0 0 0];
nz =0: length(z)-1;
subplot(2,1,1);stem(ny,y);axis([0  length(z) 0 5.5 ]);
xlabel('x');
ylabel('y');
subplot(2,1,2);stem(nz,z);axis([0 length(z) 0 5.5]);
xlabel('n');
ylabel('z');