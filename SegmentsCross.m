function [noc,P] = SegmentsCross(A1,B1,A2,B2);
% To find if ginven segments A1B1 and A2B2 intersect 
% and find the crossing point P 
% 
L1=LineThrough2Points(A1,B1);
L2=LineThrough2Points(A2,B2);
d1a=Distance2Line(L1,A2);
d1b=Distance2Line(L1,B2);
d2a=Distance2Line(L2,A1);
d2b=Distance2Line(L2,B1);
if (d1a*d1b>0)||(d2a*d2b>0); 
        noc=0;   P=[NaN,NaN]; % no intersection 
else   [noc,P] = LinesCross(L1,L2); 
end;    
end
