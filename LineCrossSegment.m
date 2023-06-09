function [noc,P] = LineCrossSegment(L,A,B);
% To state if the given line L cross the segment AB 
% and find the point P of intersection 
% 
da=Distance2Line(L,A);
db=Distance2Line(L,B);
if da*db>0; 
        noc=0;   P=[NaN,NaN]; % no intersection 
else
        L1=LineThrough2Points(A,B);
        [noc,P] = LinesCross(L,L1);
end;
end
