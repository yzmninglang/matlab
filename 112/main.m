%% ???
% ????
clear;
clc

% ????
load('data.mat');

global a u;

u = data(1);
a = data(2);

t_total = 184.7787;
t_n = 0.95 * t_total;

% ???????????
x_n = 1:10;
x0 = zeros(4,10);
x0(1,:) = 11.7 * x_n;
x0(2,:) = 8 + 12.8 * x_n;
x0(3,:) = 18 + 13.8 * x_n;
x0(4,:) = 24 + 14.7 * x_n;

fminimax(@fun3,x0,[],[],[],[],[],[],@nonlcon3);