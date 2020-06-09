function thr = bayesthf(y,noise_var)
%%% Bayes Shrink Threhold Computation.

%%% Author : B.K. SHREYAMSHA KUMAR 
%%% Created on 31-12-2009.
%%% Updated on 31-12-2009.

[p,q]=size(y);
meany=sum(sum(y))/(p*q);
vary=sum(sum((y-meany).^2))/(p*q);

tt=vary-noise_var;  %图像方差-噪声方差 (通过图像一级小波高频HH的硬阈值计算)
if(tt<0)
    tt=0;
end
sigmax=sqrt(tt);
thr=noise_var/sigmax;
if(thr==inf)
    thr=max(max(abs(y)));
end