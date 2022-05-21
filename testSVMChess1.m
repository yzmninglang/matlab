clear all;
fid = fopen('krkopt.DATA');
c=fread(fid,3)

vec=zeros(6,1);
xapp=[];
yapp=[];
while ~feof(fid)
    string=[];
    c=fread(fid,1);
    flag=flag+1;
    while c~=13
        string=[string c];
        c=fread(fid,1);
    end
    fread(fid,1);
    if length(string)>10
        vec(1)=string(1)-96;
        vec(2)=string(3)-48;
        vec(3)=string(5)-96;
        vec(4)=string(7)-48;
        vec(5)=string(9)-96;
        vec(6)=string(11)-48;
        xapp=[xapp vec];
        if string(13)==100
            yapp=[yapp,[1 0]'];
        else
            yapp=[yapp,[0 1]'];
        end;
    end;
end;
fclose(fid)
        
        