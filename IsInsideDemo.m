function in=IsInsideDemo(X,Y,P,WS);
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
  elseif  s>eps;   sgn= 1; 
  else             sgn= 0;    
  end;
  S0str=num2str(180*S/pi,'%7.3f');
  angstr=num2str(abs(180*sgn*a21/pi),'%7.3f'); 
  if (sgn*a21>0); sgnstr='-'; else sgnstr='+'; end;
  S=S-sgn*a21;
  S1str=num2str(180*S/pi,'%7.3f');
  T=['S=',S0str,'^o',sgnstr,angstr,'^o=',S1str,'^o'];
  PlotAngles(X,Y,k,sgn,P,WS,T)
  pause
end;
if abs(S)<eps; in=0; end; % is outside
end