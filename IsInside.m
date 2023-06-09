function in=IsInside(X,Y,P);
% To check of a point  P is inside the given polygon using angles
%
N=size(X,1)-1;
eps=0.0001;
S=0;
in=1;                    % is inside by default
for k=1:N;
    P1=[X(k),Y(k)];   P2=[X(k+1),Y(k+1)];
    v1=P1-P;          v2=P2-P;
   v21=P2-P1;
  a21=ang(v1,v2);
  s=perp(v1)*v21';
  if  abs(pi-a21)<eps; in=0.5; return; % on the border
  elseif  s<-eps;  sgn=-1;         
  elseif  s>eps    sgn= 1; 
  else             sgn= 0;    
  end;
  S=S-sgn*a21;  
end;
if abs(S)<eps; in=0; end; % is outside
end