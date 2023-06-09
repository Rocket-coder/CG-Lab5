%TESTISINSIDE;
% Method of Angles
w=6; WS=[-w, w, -w, w];       % the window size  
N=4;
%[X,Y,Name] = GetPolygon(N,0,0,WS);
%[X,Y,Name] = GetStar(N,0,0,WS);
[X,Y,Name] = GetRegular(N,0,0,WS);
printstring('--- ',Name);
pause
hold off
a=WS(1)+1; b=WS(2)-1;
P=(b-a)*rand(1,2)+a;          % a random point
in=IsInsideDemo(X,Y,P,WS);
hold off
if     in==1;     T='inside the polgon';       color='g'; 
elseif in==0.5;   T='on the border of polgon'; color='y';
else              T='outside the polgon';      color='m';
end;
W=['BY ANGLES: the point X=',vec2strfloat(P,7,1),' is ',T];
shadecol=[0.9,0.9,1.0]; % light blue
arrow=0;
PlotPolygon(X,Y,shadecol,arrow,WS,W)
hold on
MarkPoint(P,color,WS,W)
hold off

