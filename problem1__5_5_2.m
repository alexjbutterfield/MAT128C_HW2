tol = 10^(-4);
% Part (a)
f5_5_2a = @(t,y) (y./t).^2 + y./t;
t = 1.0;
tend = 1.2;
w = 1;
hmax = 0.05;
hmin = 0.02;
h = hmax;
y5_5_2a = w;
t5_5_2a = t;
while (t + h)< tend
    [t,w,h] = RKF(f5_5_2a, t, w, h, tol); 
    if h > hmax
       h = hmax;
    end
    y5_5_2a = [y5_5_2a, w];
    t5_5_2a = [t5_5_2a, t];
end
h = tend - t;
if h < hmin
    disp('minimum h exceeded');
else
    [t,w,h] = RKF(f5_5_2a, t, w, h, tol);
    y5_5_2a = [y5_5_2a, w];
    t5_5_2a = [t5_5_2a, t];
end

% Part (b)
f5_5_2b = @(t,y) sin(t) + exp(-t);
t = 0;
tend = 1;
w = 0;
hmax = 0.25;
hmin = 0.02;
h = hmax;
y5_5_2b = w;
t5_5_2b = t;
while (t + h)< tend
    [t,w,h] = RKF(f5_5_2b, t, w, h, tol); 
    if h > hmax
       h = hmax;
    end
    y5_5_2b = [y5_5_2b, w];
    t5_5_2b = [t5_5_2b, t];
end
h = tend - t;
if h < hmin
    disp('minimum h exceeded');
else
    [t,w,h] = RKF(f5_5_2b, t, w, h, tol);
    y5_5_2b = [y5_5_2b, w];
    t5_5_2b = [t5_5_2b, t];
end

% Part (c)
f5_5_2c = @(t,y) (y.^2 +y)./t;
t = 1;
tend = 3;
w = -2;
hmax = 0.5;
hmin = 0.02;
h = hmax;
y5_5_2c = w;
t5_5_2c = t;
while (t + h)< tend
    [t,w,h] = RKF(f5_5_2c, t, w, h, tol); 
    if h > hmax
       h = hmax;
    end
    y5_5_2c = [y5_5_2c, w];
    t5_5_2c = [t5_5_2c, t];
end
h = tend - t;
if h < hmin
    disp('minimum h exceeded');
else
    [t,w,h] = RKF(f5_5_2c, t, w, h, tol);
    y5_5_2c = [y5_5_2c, w];
    t5_5_2c = [t5_5_2c, t];
end

% Part (d)
f5_5_2d = @(t,y) t.^2;
t = 0;
tend = 2;
w = 0;
hmax = 0.5;
hmin = 0.02;
h = hmax;
y5_5_2d = w;
t5_5_2d = t;
while (t + h)< tend
    [t,w,h] = RKF(f5_5_2d, t, w, h, tol); 
    if h > hmax
       h = hmax;
    end
    y5_5_2d = [y5_5_2d, w];
    t5_5_2d = [t5_5_2d, t];
end
h = tend - t;
if h < hmin
    disp('minimum h exceeded');
else
    [t,w,h] = RKF(f5_5_2d, t, w, h, tol);
    y5_5_2d = [y5_5_2d, w];
    t5_5_2d = [t5_5_2d, t];
end