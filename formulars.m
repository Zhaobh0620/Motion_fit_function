clear
syms a1 a2 a3 a4 a5 b1 b2 b3 b4
x = [1, 0, 1, 0;
    exp(b1)*cos(b2), exp(b1)*sin(b2), exp(b3)*cos(b4), exp(b3)*sin(b4);
    b1, b2, b3, b4; 
    b1*exp(b1)*cos(b2) - b2*exp(b1)*sin(b2), ...
    b1*exp(b1)*sin(b2) + b2*exp(b1)*cos(b2), ...
    b3*exp(b3)*cos(b4) - b4*exp(b3)*sin(b4),...
    b3*exp(b3)*sin(b4) + b4*exp(b3)*cos(b4)];
b=[-a1;-a1;0;0];
y= x\b;
f(a1, b1, b2, b3, b4) = y;
g(a1, b1, b2, b3, b4) = x;
z = f(1, 1, 2, 1, 3);
zz = g(1, 1, 2, 1, 3);
double(z)
double(zz)