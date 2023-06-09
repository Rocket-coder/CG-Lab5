function DemoShading(X,Y,version,WS)
%
colin='g';
colout=[1,0.8,0.8];
colbrd='y';
switch version 
    case 1; T='by the method of angles ';   
    case 2; T='by the method of intersections';   
    case 3; T='of convex polytopes (only!)'; 
    otherwise error('Wrong version')
end;
PlotPolygon(X,Y,0,0,WS,['Shading ',T])
d=0.5;
Xma=max(X(:))+d; Xmi=min(X(:))-d;
Yma=max(Y(:))+d; Ymi=min(Y(:))-d;
dx=0.25; 
ft='\fontsize{12}\bf\color{black}';
hd=' Shading in progress...';
h=waitbar(0,[ft,hd]);
set(h,'Color','c');
np=ceil((Xma-Xmi)/dx);
pin=0;
pout=0;
pbord=0;
t=0; 
tic;
for x=Xmi:dx:Xma;
    t=t+1;
    for y=Ymi:dx:Yma;
        switch version 
           case 1;      in=IsInside(X,Y,[x,y]);   
           case 2; [in,~]=IsInside2(X,Y,[x,y],WS);   
           case 3;     in=IsInsideConvex(X,Y,[x,y]);    
        end;             
       if     in==1;    pin=pin+1;     colour=colin;
       elseif in==0.5;  pbord=pbord+1; colour=colbrd;
                           % printvector('[x,y]=',[x,y]);
       else             pout=pout+1;   colour=colout;
       end;
       MarkPoint([x,y],colour,WS,['Shading ',T]);
       hold on
    end;
    waitbar(t/np);
end;
close(h);
printvector('time=',toc);
PlotPolygon(X,Y,0,0,WS,['Shading ',T])
printvector('[pin, pbord, pout, total]=',...
             [pin,pout,pbord,pin+pout+pbord]);
hold off         
end

