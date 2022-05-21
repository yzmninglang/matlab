% 基于倒谱法的基音周期检测
function [vocieseg,vsl,SF,Ef,period] = pitch_Ceps(x,wnd,inc,T1,fs,miniL)
% wnd是窗函数，length(wnd)是帧长
% miniL为帧长的最小值
% Syntax: [vocieseg,vsl,SF,Ef,period] = myFun(input)
% x代表语音数据,wlen代表帧长
% inc代表帧移
% NIS代表无声段的帧数，用来计算阈值
% vsl代表voiceseg的长度
% Sf代表语音帧标志(SF=1代表该段为语音段)
% EF是噪声/无声段（EF=1代表噪声）
% period是基音周期
% Long description
    
end

