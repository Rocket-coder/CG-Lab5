%TESTINTERSECTIONS;
P0=[X(1),Y(1)]; P1=[X(2),Y(2)]; P2=[X(3),Y(3)];
P3=[X(4),Y(4)]; P4=[X(5),Y(5)]; P5=[X(6),Y(6)];
%------------------------------------------------
L1=LineThrough2Points(P0,P1);
L3=LineThrough2Points(P0+P2,P1+P2); % L3 || L1
L2=LineThrough2Points(P2,P1);
%------------------------------------------------
printstring('---','Intersections of lines');
[noc,P] = LinesCross(L1,L2);
printvector('P=',P); printvector('noc =',noc);
[noc,P] = LinesCross(L1,L1);
printvector('P=',P); printvector('noc =',noc);
[noc,P] = LinesCross(L1,L3);
printvector('P=',P); printvector('noc =',noc);
%------------------------------------------------
printstring('---','Intersections of line segments');
[noc,P] = SegmentsCross(P0,P1,P4,P5);
printvector('noc =',noc); printvector('P=',P); 
[noc,P] = SegmentsCross(P1,P3,P2,P5);
printvector('noc =',noc); printvector('P=',P); 
[noc,P] = SegmentsCross(P0,P1,P1,P2);
printvector('noc =',noc); printvector('P=',P); 
[noc,P] = SegmentsCross(P0,P1,P1,P0);
printvector('noc =',noc); printvector('P=',P); 