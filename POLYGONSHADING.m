%POLYGONSHADING;
N=5;        % number of vertices 
w=6; WS=[-w, w, -w, w]; %WS=[Xmin, Xmax, Ymin, Ymax] - bounds of the window
shadecol=0;  arrow=0;
%[X,Y,Name] = GetPolygon(N,shadecol,arrow,WS);
%[X,Y,Name] = GetStar(N,shadecol,arrow,WS);
[X,Y,Name] = GetRegular(N,shadecol,arrow,WS);
printstring('--- ',Name);
pause
hold off
%version=1;         % 'method of angles '; 
version=2;          % 'method of intersections';
%version=3;         % 'for convex polytopes only'; 
DemoShading(X,Y,version,WS);
hold off
pause
shadecol=[0.75,1.0,0.75];  % light green
PlotPolygon(X,Y,shadecol,0,WS,'Shaded by the  fill function')
hold off



