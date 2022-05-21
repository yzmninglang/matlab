function [ y] = xy_plot( input,x )
%UNTITLED Summary of this function goes here
%   Detailed explanation goes here
y=input(x),plot(x,y,'r--');
xlabel('x');ylabel('f(x)');
end

