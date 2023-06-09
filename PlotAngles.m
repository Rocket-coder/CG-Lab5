function PlotAngles(X,Y,k,sgn,P,WS,Name)
%
%clf
set(gcf,'Color','w');
% WS=[Xmin, Xmax, Ymin, Ymax] % bounds of the region
subplot(1,1,1)
%-- Plot Polygon ------------------------------------
hold off
shadecol='w'; arrow=1;
PlotPolygon(X,Y,shadecol,arrow,WS,Name)     
hold on       
%-- The Point P --------------------------------
d = 0.2;
plot(P(1),P(2),'-bo','LineWidth',1,'MarkerEdgeColor','k',...
                 'MarkerFaceColor','b','MarkerSize',12);  
ts2='\fontsize{16}\bf\color{black}';
text(P(1)+d, P(2), [ts2,'X']); 
%-- Vectors --------------------------------
P1=[X(k),Y(k)];   P2=[X(k+1),Y(k+1)];
%    v1=P1-P;          v2=P2-P;
Tx=[P(1),X(k),X(k+1),P(1)];  Ty=[P(2),Y(k),Y(k+1),P(2)];
plot(Tx,Ty,...
    '--ko','LineWidth',2,'MarkerEdgeColor','k',...
              'MarkerFaceColor','k','MarkerSize',2);
if     sgn==1;    shadecol=[1,0.8,0.8]; % pink
elseif sgn==0     shadecol='y';
else              shadecol='g';
end;          
fill(Tx,Ty,shadecol);                
hold on
shadecol=0;
arrow=1;
PlotPolygon(X,Y,shadecol,arrow,WS,Name)
%---------------------------------------------------------
set(gca,'XColor','b','YColor','b','fontsize',14,'fontweight','b');
ts1='\fontsize{18}\bf\color{red}';
title([ts1,Name]);  
ts3='\fontsize{16}\bf\color{black}';
xlabel([ts3,'x']); ylabel([ts3,'y']); 
axis(WS);
axis square;  
grid off
end
%
