I=imread('rice.png');
BG=imopen(I,strel('disk',15));
I2=imsubtract(I,BG);level=graythresh(I2);
BW=im2bw(I2,level);
[labeled,numObject]=bwlabel(BW,8);
C=zeros(256,256,3)
for i =1:size(labeled,1)
    for m=1:size(labeled,2)
        if labeled(i,m)~=0
            C(i,m,1)=255;
        end
    end
end
imshow(C);
