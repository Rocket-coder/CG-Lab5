function [X,Y,Name] = GetPolygon(N,shadecol,arrow,L);
% N - number of points in the curve y=equation(x)
% [t0,t1] - interval
%-----------------------------------------------------
if N<3; error('N<3'); end;
dt=pi/360;
t0=0; t1=2*pi;  % the interval 
ra=1.0; rb=5.0;
TF=ceil(abs(t1-t0)/dt);
R=zeros(TF,1);
XF=zeros(TF,1); YF=zeros(TF,1); 
for k=1:TF;
    t=t0+(k-1)*dt;
    [R(k),~]=parametric2(t,t0,t1);  
end;
Rma=max(R(:));  Rmi=min(R(:));
if abs(Rma-Rmi)<dt; Rmi=0; end;
c=(rb-ra)/(Rma-Rmi);
RN=ra+c*(R-Rmi);
for k=1:TF;
    t=t0+(k-1)*dt;
    XF(k)=RN(k)*cos(t);
    YF(k)=RN(k)*sin(t);
end;
[~,Title]=parametric2(t0,t0,t1);
X=zeros(N+1,1);
Y=zeros(N+1,1);
DN=ceil(TF/N)-1;
X(N+1)=XF(1); Y(N+1)=YF(1); 
for k=1:N;
    s=1+(k-1)*DN;
    X(k)=XF(s); Y(k)=YF(s); 
end;
convex=IsConvex(X,Y);
if convex==0; Q='Concave '; else Q='Convex '; end;
%------------------------------------------------------
Name=[Q,'polygon on ',int2str(N),' ponts based on ',Title];
PlotPolygon(X,Y,shadecol,arrow,L,Name);
end

