%exm2_33_for_end.m


a=eye(6);
for ii=1:5
    a(ii,ii+1)=2;
    a(ii+1,ii)=2;
end