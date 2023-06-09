function [y,Name]=equation20(x)
C=[-0.914,1.064,1.714,0.771,2.636];
Name='y=-0.91x+1.06sin(1.71x)+0.77cos(2.64x)';
y=C(1)*x+C(2)*sin(C(3)*x)+C(4)*cos(C(5)*x);
end

