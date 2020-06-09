function y = threshf(x,sorh,t,alpha)
%%% THRESHf Perform soft or hard or trimmed thresholding. 
%%% Y = threshf(X,SORH,T) returns soft (if SORH = 's')
%%% or hard (if SORH = 'h') T-thresholding  of the input 
%%% vector or matrix X. T is the threshold value.
%%%
%%% Y = threshf(X,'s',T) returns Y = SIGN(X).(|X|-T) for |X|>T else 0. soft 
%%% thresholding is shrinkage.
%%%
%%% Y = threshf(X,'h',T) returns Y = X for (|X|>T) else 0. hard
%%% thresholding is cruder.
%%%
%%% Y = threshf(X,'t',T,alpha) returns Y = X*[|X|^alpha-T^alpha]/|X|^alpha for (|X|>T), 
%%% else 0. trimmed thresholding is something between soft and hard thresholding.
%%%
%%% Author : B.K. SHREYAMSHA KUMAR 
%%% Created on 01-12-2009.
%%% Updated on 01-12-2009.

switch sorh
    case 's'
        tmp = (abs(x)-t);   %系数绝对值减去bayesShrink
        tmp = (tmp+abs(tmp))/2;  
        y   = sign(x).*tmp;  %又图像确定的符号函数值与阈值函相乘

    case 'h'
        y   = x.*(abs(x)>t);  %X与逻辑式相乘

    case 't'
        x=x+eps;
        tmp = abs(x).^alpha-t^alpha;    %alpha=2时，图像加无穷小量的平方减去阈值的平方
        tmp = (tmp+abs(tmp))/2;
        y = x.*tmp./abs(x).^alpha;

    otherwise
        error('Invalid argument value.')
end
