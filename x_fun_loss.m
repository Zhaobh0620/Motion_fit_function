function result = x_fun_loss(b)
    global y
    syms b1 b2 b3 b4
    f(b1, b2, b3, b4) = y;
    z = f(b(1),b(2),b(3),b(4));
    F = @(b, xdata)z(1) + z(2)*xdata + z(3)*exp(b(1)).*cos(b(2)*xdata) +...
        z(4)*exp(b(1)).*sin(b(2)*xdata) + z(5)*exp(b(3)).*cos(b(4)*xdata) +...
        z(6)*exp(b(3)).*sin(b(4)*xdata);


    v = [0 0.25 1.75 6 8 10.5 9.5 7 6.25 7.5 3.5 1 0 0.5 0.25 0];
    t = [3 3.25 4 4.5 5 5.5 6 6.75 7 8 9 9.5 11 12 13 14];
    t = (t-min(t))/ (max(t) -min(t));
    tq = 0:0.05:1;
    vq1 = interp1(t,v,tq);
    x = [0]; 
    for i=2:length(tq)
        x(i) = trapz(tq(1:i),vq1(1:i));
    end
    v_hat = double(F(b, x));
    result = norm(v_hat-x);
end