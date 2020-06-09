function h=gauss_ker2D(sigmas,ksize)

%%% 2D Gaussian Kernel Generation.

%%% Author : B.K. SHREYAMSHA KUMAR
%%% Created on 03-05-2011.
%%% Updated on 03-05-2011.  

% %%% Gaussian Kernel Generation. 
% %% 1st Method.
% for x=-floor(ksize/2):floor(ksize/2)
%    for y=-floor(ksize/2):floor(ksize/2)
%       h1(x+floor(ksize/2)+1,y+floor(ksize/2)+1)=exp(-(x^2+y^2)/(2*(sigmas)^2));
%    end
% end

%% 2nd Method.
x=[-floor(ksize/2):floor(ksize/2)];
x2=repmat(x.^2,ksize,1);
x3=x2'+x2;
h=exp(-(x3/(2*(sigmas)^2)));

%% 3rd Methord
% [X,Y] = meshgrid(-ksize:ksize,-ksize:ksize);
% h = exp(-(X.^2+Y.^2)/(2*sigma_d^2));

% %¥¥Ω®∫Àæ‡¿Îæÿ’Û£¨e.g.
% %  [x,y]=meshgrid(-1:1,-1:1)
% % 
% % x =
% % 
% %     -1     0     1
% %     -1     0     1
% %     -1     0     1
% % 
% % 
% % y =
% % 
% %     -1    -1    -1
% %      0     0     0
% %      1     1     1
