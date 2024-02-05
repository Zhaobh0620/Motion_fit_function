clear
syms a1 a2 a3 a4 a5 b1 b2 b3 b4
x = [1, 0, 1, 0;
exp(b1)*cos(b2), exp(b1)*sin(b2), exp(b3)*cos(b4), exp(b3)*sin(b4);
b1, b2, b3, b4; 
b1*exp(b1)*cos(b2)-b2*exp(b1)*sin(b2), ...
b1*exp(b1)*sin(b2) + b2*exp(b1)*cos(b2), ...
b3*exp(b3)*cos(b4)-b4*exp(b3)*sin(b4),...
b3*exp(b3)*sin(b4)+b4*exp(b3)*cos(b4)];
b=[-a1;-a1;0;0];
y = x\b;
c = 1;
p = -12;
w= 1.5*pi;
q = 2*pi;
xdata = 0:0.02:1;

for aa1 = 5:1:15
    a = [aa1, c, w, p, q];
    f(a1, b1, b2, b3, b4) = y;
    z = f(a(1),a(2),a(3),a(4),a(5));
    F = @(a, xdata)a(1) + z(1)*exp(a(2)*xdata).*cos(a(3)*xdata)...
    + z(2)*exp(a(2)*xdata).*sin(a(3)*xdata)+ z(3)*exp(a(4)*xdata).*cos(a(5)*xdata) ...
    +z(4)*exp(a(4)*xdata).*sin(a(5)*xdata);
    v_hat = double(F(a, xdata));
    plot(xdata, v_hat, 'LineWidth', 2, 'DisplayName', string(aa1))
    hold on
end
legend('show', 'FontSize', 18);
title('c = 1 p = -12, w = 1.5*\pi q = 2*\pi', 'FontSize', 18);
hold off









