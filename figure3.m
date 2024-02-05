syms b1 b2 b3 b4 t

tt = 0:0.02:1;

bb1 = -1.6960;
bb2 = -1.5119;
bb3 = -1.0449;
bb4 = 21.5051;

v2(b1, b2, b3, b4, t) = exp(b1*t).*cos(b2*t);
v3(b1, b2, b3, b4, t) = exp(b1*t).*sin(b2*t);
v4(b1, b2, b3, b4, t) = exp(b3*t).*cos(b4*t);
v5(b1, b2, b3, b4, t) = exp(b3*t).*sin(b4*t);

vv2 = double(v2(bb1, bb2, bb3, bb4, tt));
vv3 = double(v3(bb1, bb2, bb3, bb4, tt));
vv4 = double(v4(bb1, bb2, bb3, bb4, tt));
vv5 = double(v5(bb1, bb2, bb3, bb4, tt));

plot(tt, vv2, 'LineWidth', 2, 'DisplayName', 'v2')
hold on
plot(tt, vv3, 'LineWidth', 2, 'DisplayName', 'v3')
plot(tt, vv4, 'LineWidth', 2, 'DisplayName', 'v4')
plot(tt, vv5, 'LineWidth', 2, 'DisplayName', 'v5')
legend('show', 'FontSize', 18);
hold off