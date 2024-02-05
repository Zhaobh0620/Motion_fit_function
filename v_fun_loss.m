function result = v_fun_loss(a)
    global y
    syms a1 b1 b2 b3 b4
    f(a1, b1, b2, b3, b4) = y;
    z = f(a(1),a(2),a(3),a(4),a(5));

    v = [0 0.25 1.75 6 8 10.5 9.5 7 6.25 7.5 3.5 1 0 0.5 0.25 0];
    xdata = [3 3.25 4 4.5 5 5.5 6 6.75 7 8 9 9.5 11 12 13 14];
    xdata = xdata / max(xdata);

    F = @(a, xdata)a(1) + z(1)*exp(a(2)*xdata).*cos(a(3)*xdata)...
    + z(2)*exp(a(2)*xdata).*sin(a(3)*xdata)+ z(3)*exp(a(4)*xdata).*cos(a(5)*xdata) ...
    +z(4)*exp(a(4)*xdata).*sin(a(5)*xdata);

    v_hat = double(F(a, xdata));
    result = norm(v_hat-v);
end