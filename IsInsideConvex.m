function in=IsInsideConvex(X,Y,P)
% To test if a point is inside a convex polytope
eps=0.00001;
N=size(X,1)-1;
D=zeros(1,N);
for k=1:N;
    P0=[X(k),  Y(k)]; 
    P1=[X(k+1),Y(k+1)];
    v01=perp(P1-P0);
    v=P0-P;
    D(k)=v01*v';
end;     
Dma=max(D); Dmi=min(D);
if abs(Dma)<eps; Dma=0; end;
if abs(Dma)<eps; Dmi=0; end;
if      Dma*Dmi<0; 
                in=0;   %printvector('Strictly outside: P=',P); 
elseif  Dma*Dmi==0;  
                in=0.5; %printvector('On the border: P=',P);
else            in=1;   %printvector('Strictly inside: P=',P);  
end;
end