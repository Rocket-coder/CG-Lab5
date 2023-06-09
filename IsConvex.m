function convex=IsConvex(X,Y)
%To check if the given polytope is convex
%
N=size(X,1)-1;
Sides=zeros(N,3);
D=zeros(1,N);
for k=1:N;
    Pk=[X(k),Y(k)]; Pk1=[X(k+1),Y(k+1)];
    Sides(k,1:3)=LineThrough2Points(Pk,Pk1);
end; 
convex=1;
for k=1:N;                         % side from P(k) to P(k+1)
    L=Sides(k,:);
    for p=1:N;                     % vertex [X(p),Y(p)]
       P=[X(p),Y(p)]; 
       D(p)=Distance2Line(L,P);    % distances to vertices     
    end;
    Dma=max(D); Dmi=min(D);
    if Dma*Dmi<0; %printvector('STOP: concave k=',k); 
                  convex=0; break
    end;
end;    
%if  convex==1;
%    printstring('END:','convex');   
%end;    
end

