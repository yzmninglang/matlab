I=imread('rice.png');level=graythresh(I);
BG=imopen(I,strel('disk',15));
I2=imsubtract(I,BG);BW=im2bw(I2,graythresh(I2));
ObjI=bwselect(BW);imshow(ObjI);