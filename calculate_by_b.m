clear
x = [1 1.5*pi -12 2*pi]';
t = [3 3.25 4 4.5 5 5.5 6 6.75 7 8 9 9.5 11 12 13 14];
t = (t-min(t))/ (max(t) -min(t));
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

plot(t, x_fun(x,t))
hold on

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
plot(t, x3, 'LineWidth', 2, 'DisplayName', 'x3')
hold on
plot(t, x4, 'LineWidth', 2, 'DisplayName', 'x4')
plot(t, x5, 'LineWidth', 2, 'DisplayName', 'x5')
plot(t, x6, 'LineWidth', 2, 'DisplayName', 'x6')
legend('show', 'FontSize', 18);
title(['a=',num2str(a(1), 3),',', num2str(a(2), 3),',', num2str(a(3), 3),',',...
    num2str(a(4), 3),',', num2str(a(5), 3),',', num2str(a(6), 3)], 'FontSize', 18);
hold off


