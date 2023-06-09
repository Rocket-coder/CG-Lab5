function Timing(X,Y,version,WS)
%
colin='g';
colout=[1,0.8,0.8];
colbrd='y';
shadecol=[0.9,0.9,1.0];
switch version 
    case 1; T='by the method of angles ';   
    case 2; T='by the method of intersections';   
    case 3; T='of convex polytopes (only!)'; 
    otherwise error('Wrong version')
end;
PlotPolygon(X,Y,shadecol,0,WS,['Shading ',T])
d=0.5;
Xma=max(X(:))+d; Xmi=min(X(:))-d;
Yma=max(Y(:))+d; Ymi=min(Y(:))-d;
dx=0.25; 
pin=0;
pout=0;
pbord=0;
% t=0; 
tic;
for x=Xmi:dx:Xma;
    for y=Ymi:dx:Yma;
        switch version 
           case 1;      in=IsInside(X,Y,[x,y]);   
           case 2;  [in,~]=IsInside2Fast(X,Y,[x,y],WS);   
           case 3;      in=IsInsideConvex(X,Y,[x,y]);    
        end;             
        if     in==1;    pin=pin+1;     colour=colin;
        elseif in==0.5;  pbord=pbord+1; colour=colbrd;
        else             pout=pout+1;   colour=colout;
        end;
    end;
end;
printvector(['Shading ',T,' time='],toc);
PlotPolygon(X,Y,0,0,WS,['Shading ',T])
printvector('      [pin,  pout, pbord, total]=',...
                   [pin,pout,pbord,pin+pout+pbord]);
hold off         
end

