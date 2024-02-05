clear
syms b1 b2 b3 b4 b tt

c1(b1, b2, b3, b4) = exp(b1)*cos(b2);
c2(b1, b2, b3, b4) = exp(b1)*sin(b2);
c3(b1, b2, b3, b4) = exp(b3)*cos(b4);
c4(b1, b2, b3, b4) = exp(b3)*sin(b4);


bb = [0, 20, 0, 0, 0, 0]';
X = [1, 0, 1, 0, 1, 0;...
    1, 1, exp(b1)*cos(b2), exp(b1)*sin(b2), exp(b3)*cos(b4), exp(b3)*sin(b4);...
    0, 1, b1, b2, b3, b4;
    0, 1, b1*exp(b1)*cos(b2) - b2*exp(b1)*sin(b2), b1*exp(b1)*sin(b2) - b2*exp(b1)*cos(b2),...
    b3*exp(b3)*cos(b4)-b4*exp(b3)*sin(b4), b3*exp(b3)*cos(b4) + b4*exp(b3)*cos(b4);...
    0, 0, (b1^2 -b2^2)*exp(b1)*cos(b2), 2*b1*b2*exp(b1)*cos(b2), (b3^2 -b4^2)*exp(b3)*cos(b4), 2*b3*b4*exp(b3)*cos(b4);...
    0, 0, (b1^2 -b2^2)*exp(b1)*cos(b2) - 2*b1*b2*exp(b1)*sin(b2), 2*b1*b2*exp(b1)*cos(b2) + (b1^2 -b2^2)*exp(b1)*sin(b2),...
    (b3^2 -b4^2)*exp(b3)*cos(b4) - 2*b3*b4*exp(b3)*sin(b4), 2*b3*b4*exp(b3)*cos(b4) + (b3^2 -b4^2)*exp(b3)*sin(b4)];
global y
y = X\bb;


v = [0 0.25 1.75 6 8 10.5 9.5 7 6.25 7.5 3.5 1 0 0.5 0.25 0];
t = [3 3.25 4 4.5 5 5.5 6 6.75 7 8 9 9.5 11 12 13 14];
v = [0 0.5 1 2.5 6 8 9.2 9 7.5 6.75 7.25 7.5 7 6 5 5.3 5.6 4 2.5 0];%ver 3
t = [2 3 3.25 4 4.5 5 5.5 6.25 7.25 7.75 8.5 9.5 10 10.5 12 13 14 15 16 17];% t:ver 3
t = (t-min(t))/ (max(t) -min(t));
tq = 0:0.05:1;
vq1 = interp1(t,v,tq);
xdata = [0]; 
for i=2:length(t)
    xdata(i) = trapz(t(1:i),v(1:i));
end
xdata = xdata / max(xdata) * 20;

x0 = [1 1.5*pi -12 2*pi]'; % initial point
x0 = [0.2255 8.3646 .8569 23.248]';
% x0 = [15.6775  -25.1407    9.0259   -8.0709]';
[x,resnorm,~,exitflag,output] = lsqcurvefit(@x_fun,x0,t,xdata);
% -1.6122   -9.5520    8.6900    4.5313
% [x,fval,exitflag,output] = ga(@x_fun_loss, 4)
plot(t, x_fun(x,t))
hold on
plot(t, xdata)
hold off

x1 = 1;
x2= t;
xx3(b1, b2, b3, b4, tt) = exp(b1*tt).*cos(b2*tt);
xx4(b1, b2, b3, b4, tt) = exp(b1*tt).*sin(b2*tt);
xx5(b1, b2, b3, b4, tt) = exp(b3*tt).*cos(b4*tt);
xx6(b1, b2, b3, b4, tt) = exp(b3*tt).*sin(b4*tt);

x3 = double(xx3(x(1), x(2), x(3), x(4), t));
x4 = double(xx4(x(1), x(2), x(3), x(4), t));
x5 = double(xx5(x(1), x(2), x(3), x(4), t));
x6 = double(xx6(x(1), x(2), x(3), x(4), t));

figure
aa(b1, b2, b3, b4) = y;
a = double(aa(x(1), x(2), x(3), x(4)));
plot(t, x3)
hold on
plot(t, x4)
plot(t, x5)
plot(t, x6)
hold off




