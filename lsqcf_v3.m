F = @(a, xdata)a(5) + a(6)*exp(a(1)*xdata).*cos(a(2)*xdata)...
+ a(7)*exp(a(1)*xdata).*sin(a(2)*xdata)+ a(8)*exp(a(3)*xdata).*cos(a(4)*xdata) ...
+a(9)*exp(a(3)*xdata).*sin(a(4)*xdata)

v = [0 0.25 1.75 6 8 10.5 9.5 7 6.25 7.5 3.5 1 0 0.5 0.25 0];
t = [3 3.25 4 4.5 5 5.5 6 6.75 7 8 9 9.5 11 12 13 14];

Aeq = [0 0 0 1 0 0 0 0 0;0 1 0 0 0 0 0 0 0];
beq = [6*pi; 6*pi];

t = t/max(t)
x0 = [1 2*pi -12 2*pi 4 1 1 1 1 ]';
[x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,t,v)
%[x,resnorm,~,exitflag,output] = lsqcurvefit(F,x0,t,v,lb,ub,Aeq,beq)
plot(t, F(x,t))
hold on
plot(t, v)
v_hat = F(x, t);
result = sum((v-v_hat).^2)