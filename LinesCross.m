function [noc,P] = LinesCross(L1,L2);
% To find if ginven lines L1 and L2 intersect 
% and find the crossing point P 
% 
eps=0.00001;
a1=L1(1); b1=L1(2); c1=-L1(3);
a2=L2(1); b2=L2(2); c2=-L2(3);
d=a1*b2-a2*b1;
dx=b2*c1-b1*c2;
dy=c2*a1-c1*a2;
if      abs(d)>eps; 
             noc=1; P=[dx,dy]/d;   % single point
elseif (dx<eps)&&(dy<eps); 
             noc=2;   P=[NaN,NaN]; % infinitely many points
else         noc=0;   P=[NaN,NaN]; % no intersection 
end;    
end

