function L = LineThrough2Points(P0,P1);
% To find the normal equation ax+by+c=0 of a line L
% through the given points P0 and P1
%
n=ort(perp(P1-P0)); % normal vector
c=-P0*n'; a=n(1); b=n(2);
if c>0; c=-c; a=-n(1); b=-n(2); end;
L=[a,b,c];
end

