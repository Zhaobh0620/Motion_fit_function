function result = x_fun(b, xdata)
    global y
    syms b1 b2 b3 b4
    f(b1, b2, b3, b4) = y;
    z = f(b(1),b(2),b(3),b(4));
    F = @(b, xdata)z(1) + z(2)*xdata + z(3)*exp(b(1)).*cos(b(2)*xdata) +...
        z(4)*exp(b(1)).*sin(b(2)*xdata) + z(5)*exp(b(3)).*cos(b(4)*xdata) +...
        z(6)*exp(b(3)).*sin(b(4)*xdata);
    result = double(F(b, xdata));
end