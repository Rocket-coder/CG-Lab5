function CleanWindow(WS,d)
%
%clf
set(gcf,'Color','w');
% WS=[Xmin, Xmax, Ymin, Ymax] % bounds of the region
%d=0;
nw=[WS(1)+d,WS(4)-d];
ne=[WS(2)-d,WS(4)-d];
sw=[WS(1)+d,WS(3)+d];
se=[WS(2)-d,WS(3)+d];
Wx=[nw(1),sw(1),se(1),ne(1)];
Wy=[nw(2),sw(2),se(2),ne(2)];
%subplot(1,1,1)
fill(Wx,Wy,'-w'); 
hold on
%-- Corners ---------------------------------------------
plot(WS(1),WS(3),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot(WS(2),WS(3),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot(WS(1),WS(4),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5);
hold on            
plot(WS(2),WS(4),'-go','LineWidth',1,'MarkerEdgeColor','b',...
                 'MarkerFaceColor','b','MarkerSize',5); 
hold on 
%--------------------------------------------------------------
set(gca,'XColor','b','YColor','b','fontsize',14,'fontweight','b');
ts1='\fontsize{18}\bf\color{red}';
%title([ts1,Name]);  
ts3='\fontsize{16}\bf\color{black}';
xlabel([ts3,'x']); ylabel([ts3,'y']); 
axis(WS);
axis square; %axis tight; %axis equal 
grid off
end

