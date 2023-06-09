function [X,Y,Name] = GetRegular(N,shadecol,arrow,L);
% Regular N-polygon (convex)
%-----------------------------------------------------
if N<3; error('N<3'); end;
%ra=1.5; 
rb=4.0;
dt=2*pi/N; 
X=zeros(N+1,1);
Y=zeros(N+1,1);
for k=1:N;
    t=(k-1)*dt;
     X(k)=rb*cos(t);
     Y(k)=rb*sin(t);
end;
X(N+1)=X(1); Y(N+1)=Y(1); 
%------------------------------------------------------
Name=['Regular ',int2str(N),'-polygon '];
PlotPolygon(X,Y,shadecol,arrow,L,Name);
end

