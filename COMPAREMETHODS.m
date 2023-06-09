%COMPAREMETHODS;
N=7;        % number of vertices 
% WS=[Xmin, Xmax, Ymin, Ymax] % bounds of the region
w=6; WS=[-w, w, -w, w];       % the window size  
shadecol=[0.9,0.9,1.0];
arrow=0;
%[X,Y,Name] = GetPolygon(N,shadecol,arrow,WS);
[X,Y,Name] = GetStar(N,shadecol,arrow,WS);
%[X,Y,Name] = GetRegular(N,shadecol,arrow,WS);
printstring('--- ',Name);
Timing(X,Y,1,WS);
Timing(X,Y,2,WS);
Timing(X,Y,3,WS);



