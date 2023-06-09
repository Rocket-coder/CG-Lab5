function [X,Y,Name] = GetStar(N,shadecol,arrow,L);
% 2N-star (concave)
% [t0,t1] - interval
%-----------------------------------------------------
if N<3; error('N<3'); end;
N2=2*N;
ra=1.5; rb=4.5;
dt=pi/N; %round(abs(t1-t0)/N2);
X=zeros(N2+1,1);
Y=zeros(N2+1,1);
for k=1:2*N;
    t=(k-1)*dt;
    if mod(k,2)==1; r=rb; else r=ra; end; 
     X(k)=r*cos(t);
     Y(k)=r*sin(t);
end;
X(N2+1)=X(1); Y(N2+1)=Y(1); 
%------------------------------------------------------
Name=[int2str(N2),'-Star '];
PlotPolygon(X,Y,shadecol,arrow,L,Name);
end

