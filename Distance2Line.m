function d=Distance2Line(L,P);
% To find the distance d from the point P to 
% the line L given by its normal equation ax+by+c=0 
%
eps=0.0000001;
d=0;
d0=L(1)*P(1)+L(2)*P(2)+L(3);
if abs(d0)>eps; d=d0; end;
end


