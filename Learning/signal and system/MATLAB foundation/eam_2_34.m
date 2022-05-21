%exm_2_34_break.m

for n=50:200
    if rem(n,23)~=0
        continue
    else
        ans =n;
    end
    break
end