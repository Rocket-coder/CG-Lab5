function PlotIntersection(Px,Py,P,PL,WS,Name)
% 
N=size(Px,1)-1;
set(gcf,'Color','w');
L=LineThrough2Points(P,PL);
% WS=[Xmin, Xmax, Ymin, Ymax] % bounds of the region
d=0.2;
nw=[WS(1)+d,WS(4)-d];
ne=[WS(2)-d,WS(4)-d];
sw=[WS(1)+d,WS(3)+d];
se=[WS(2)-d,WS(3)+d];
[n1,P1] = LineCrossSegment(L,sw,nw);
[n2,P2] = LineCrossSegment(L,nw,ne);
[n3,P3] = LineCrossSegment(L,ne,se);
[n4,P4] = LineCrossSegment(L,se,sw);
C=[n1,n2,n3,n4];
LP=[P1;P2;P3;P4];
ind=find(C>0);
B=LP(ind(1),1:2);  
A=LP(ind(2),1:2);
X=[A(1),B(1)]; Y=[A(2),B(2)];
subplot(1,1,1)
%-- Line AB ------------------------------------
plot(X,Y,'--ko','LineWidth',2,'MarkerEdgeColor','k',...
              'MarkerFaceColor','k','MarkerSize',2); 
arl=1.0;
dX=diff(X); dY=diff(Y);
quiver(X(1:end-1),Y(1:end-1),arl*dX,arl*dY,0,...
             '-k','LineWidth',2,'MarkerEdgeColor','k',...
              'MarkerFaceColor','k','MarkerSize',2); 
hold on       
%-- The Point P --------------------------------
d = 0.2;
plot(P(1),P(2),'-gs','LineWidth',1,'MarkerEdgeColor','k',...
                 'MarkerFaceColor','g','MarkerSize',15);  
ts2='\fontsize{16}\bf\color{black}';
text(P(1)+d, P(2), [ts2,'X']); 
hold on
%-- Normal vectors --------------------------------
for k=1:N;
    Ak=[Px(k),Py(k)]; Bk=[Px(k+1),Py(k+1)]; Ck=(Ak+Bk)/2; % middle point
    Vk=ort(perp(Bk-Ak))+Ck;
    Qx=[Ck(1),Vk(1)]; Qy=[Ck(2),Vk(2)];
plot(Qx,Qy,'-m','LineWidth',3,'MarkerEdgeColor','k',...
              'MarkerFaceColor','k','MarkerSize',1); 
arl=1;
dX=diff(Qx); dY=diff(Qy);
quiver(Qx(1:end-1),Qy(1:end-1),arl*dX,arl*dY,0,...
             '-m','LineWidth',3,'MarkerEdgeColor','k',...
              'MarkerFaceColor','k','MarkerSize',1); 
hold on   
%---------------------------------------------------------
set(gca,'XColor','b','YColor','b','fontsize',14,'fontweight','b');
ts1='\fontsize{18}\bf\color{red}';
title([ts1,Name]);  
ts3='\fontsize{16}\bf\color{black}';
xlabel([ts3,'x']); ylabel([ts3,'y']); 
axis(WS);
axis square; %axis tight; %axis equal 
grid off
%hold off
end
%
