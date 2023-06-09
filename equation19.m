function [y,Name]=equation19(x)
C=[-0.075,-3.042,2.221,-2.124,1.526];
Name='y=-0.08x-3.04sin(2.22x)-2.12cos(1.53x)';
y=C(1)*x+C(2)*sin(C(3)*x)+C(4)*cos(C(5)*x);
end

