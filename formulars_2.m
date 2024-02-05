clear
syms a1 b1 b2 b3 b4
h2(a1, b1, b2, b3, b4) = b1*exp(b1)*cos(b2) - b2*exp(b1)*sin(b2);
h3(a1, b1, b2, b3, b4)  = b1*exp(b1)*sin(b2) + b2*exp(b1)*cos(b2);
h4(a1, b1, b2, b3, b4)  = b3*exp(b3)*cos(b4) - b4*exp(b3)*sin(b4);
h5(a1, b1, b2, b3, b4)  = b3*exp(b3)*sin(b4) + b4*exp(b3)*cos(b4);

c1(a1, b1, b2, b3, b4)  = -b3*h5 + b4*h4;
c2(a1, b1, b2, b3, b4)  = b1*h5 - b4*h2 - b3*h5 + b4*h4;
f(a1, b1, b2, b3, b4)  = b4*h3 - b2*h5;

d2(a1, b1, b2, b3, b4) = b4*exp(b1)*cos(b2) - b1*exp(b3)*sin(b4);
d3(a1, b1, b2, b3, b4) = b4*exp(b1)*sin(b2) - b2*exp(b3)*sin(b4);
d4(a1, b1, b2, b3, b4) = b4*exp(b3)*cos(b4) - b3*exp(b3)*sin(b4);

g2(a1, b1, b2, b3, b4) = -(f*b4 + c1*d3 - f*d4)/(f*d2 + c2*d3 - f*d4);

a2(a1, b1, b2, b3, b4) = g2 * a1;
a3(a1, b1, b2, b3, b4) = (c1 + g2*c2) / f * a1;
a4(a1, b1, b2, b3, b4) = -(1+g2) * a1;
a5(a1, b1, b2, b3, b4) = (f*g2*b1 + (c1 + c2*g2)*b2 - f*(1+g2)) / (-f*b4) * a1;
double(a2(1, 1, 2, 1, 3))
double(a3(1, 1, 2, 1, 3))
double(a4(1, 1, 2, 1, 3))
double(a5(1, 1, 2, 1, 3))
