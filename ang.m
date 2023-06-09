function fi=ang(v,w)
% Angle between vectors
if   (norm(v)==0)||(norm(w)==0); fi=0;
     %printvector('ERROR in ang: zero-vector: ', 0); 
else fi=acos(ort(v)*(ort(w))');
end;    
end               