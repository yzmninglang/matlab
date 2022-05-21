%exm5_7_sound.m

f=262;fs=8192;
omega=2*pi*f/fs;
n=0:fs-1;
x=sin(n*omega);
sound(x,fs);
