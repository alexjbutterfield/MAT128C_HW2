function [x,v] = rk4(h,v0,x0) 
f = @(t,y) sin(t) + exp(-t);
v = zeros(4,1);
x = zeros(4,1);
v(1) = v0;
x(1) = x0;

for j = 2:4
    K1 = h*f(x(j-1), v(j-1));
    K2 = h*f(x(j-1)+ h/2, v(j-1)+ K1/2); 
    K3 = h*f(x(j-1) + h/2, v(j-1) + K2/2);
    K4 = h*f(x(j-1) + h, v(j-1) + K3);
    v(j) = v(j-1) + (K1 + K2 + K3 + K4)/6;
    x(j) = x0 + j*h;
end

x = x(2:end);
v = v(2:end);
