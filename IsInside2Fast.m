function [in,PL]=IsInside2Fast(X,Y,P,WS)
% To check of a point  P is inside the given polygon using intersections
%
N=size(X,1)-1;
eps=0.0001;
ep1=eps; 
% WS=[Xmin, Xmax, Ymin, Ymax] % bounds of the region
% a=WS(1); b=WS(2); 
% newline=true;
% while newline==true
%    PL=(b-a)*rand(1,2)+a; 
%    if norm(P-PL)<ep1; continue; end;
%    newline=false;
%    for k=1:N;
%        Pk=[X(k),Y(k)]; 
%        L = LineThrough2Points(P,PL);
%        d=Distance2Line(L,Pk);
%        if abs(d)<ep1;  newline=true; end;    
%    end; 
% end;  
PL=[WS(1),WS(2)];
L = LineThrough2Points(P,PL);
S=0;
for k=1:N;
    sgn=0;
    Ak=[X(k),Y(k)]; Bk=[X(k+1),Y(k+1)];
    [noc,Pk] = LineCrossSegment(L,Ak,Bk);
    if noc==1; 
         v=Pk-P; vk=Bk-Ak;
         s=perp(v)*vk';
         if   s>eps; sgn= 1; 
         else        sgn=-1;    
         end;
    end;    
    S=S+sgn;   
end; 
if  S==0; 
        in=0; %printvector('Outside: P=', P);
else    in=1; %printvector(' Inside: P=', P);
end; 
end