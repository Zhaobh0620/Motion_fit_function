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
global y
% f(a1, b1, b2, b3, b4) = y;
% global z 
% z = f(a(5),a(1),a(2),a(3),a(4));


v = [0 0.25 1.75 6 8 10.5 9.5 7 6.25 7.5 3.5 1 0 0.5 0.25 0];
t = [3 3.25 4 4.5 5 5.5 6 6.75 7 8 9 9.5 11 12 13 14];
t = t / max(t)

% lsqcurvefit algorithm
x0 = [10 1 1.5*pi -12 2*pi]'; % initial point
[x,resnorm,~,exitflag,output] = lsqcurvefit(@v_fun,x0,t,v);
plot(t, v_fun(x,t))
hold on
plot(t, v)
v_hat = v_fun(x, t);
hold off

% genetic algorithm
[x,fval,exitflag,output] = ga(@v_fun_loss, 5)
plot(t, v_fun(x,t))
hold on
plot(t, v)

