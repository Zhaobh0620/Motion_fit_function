function result = v_fun(a, xdata)
    global y
    syms a1 b1 b2 b3 b4
    f(a1, b1, b2, b3, b4) = y;
    z = f(a(1),a(2),a(3),a(4),a(5));
    F = @(a, xdata)a(1) + z(1)*exp(a(2)*xdata).*cos(a(3)*xdata)...
    + z(2)*exp(a(2)*xdata).*sin(a(3)*xdata)+ z(3)*exp(a(4)*xdata).*cos(a(5)*xdata) ...
    +z(4)*exp(a(4)*xdata).*sin(a(5)*xdata);
    result = double(F(a, xdata));
end