function [r,Name]=parametric2(t,t0,t1)
a=-5.5; b=5.5;
z=a+(b-a)*(t-t0)/(t1-t0);
%[r,Name]=constant(z); 
[r,Name]=equation19(z);
end

