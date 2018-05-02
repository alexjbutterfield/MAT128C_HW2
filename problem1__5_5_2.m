tol = 10^(-4); % tolerance is constant throughout problem
%%% Part (a) %%%

% set up given IVP
f5_5_2a = @(t,y) (y./t).^2 + y./t;
t = 1.0;
tend = 1.2;
w = 1;
hmax = 0.05;
hmin = 0.02;

% initialize h, and storage vectors
h = hmax;
y5_5_2a = w;
t5_5_2a = t;

% main algorithm loop
while (t + h)< tend
    [t,w,h] = RKF(f5_5_2a, t, w, h, tol); 
    if h > hmax
       h = hmax;
    end
    y5_5_2a = [y5_5_2a, w];
    t5_5_2a = [t5_5_2a, t];
end
h = tend - t;
% do final step separately to ensure t is not larger than tend
if h < hmin
    disp('minimum h exceeded');
else
    [t,w,h] = RKF(f5_5_2a, t, w, h, tol);
    y5_5_2a = [y5_5_2a, w];
    t5_5_2a = [t5_5_2a, t];
end

% save data to csv file
csvMa = table(t5_5_2a', y5_5_2a', 'VariableNames', {'t', 'y(t)'});
writetable(csvMa, '5_5_2a.csv');

% plot data and export to png file
figure(1)
plot(t5_5_2a, y5_5_2a, '-o'); grid;
title('Plot of 5.5.2a RKF solution'); xlabel('t'); ylabel('y(t)');
saveas(gcf,'5_5_2a.png');

%%% Part (b) %%%

% setup given IVP
f5_5_2b = @(t,y) sin(t) + exp(-t);
t = 0;
tend = 1;
w = 0;
hmax = 0.25;
hmin = 0.02;

% preloop initializations
h = hmax;
y5_5_2b = w;
t5_5_2b = t;

% main algorithm loop
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

% write to csv
csvMb = table(t5_5_2b', y5_5_2b', 'VariableNames', {'t', 'y(t)'});
writetable(csvMb, '5_5_2b.csv');

% plot to png
figure(2)
plot(t5_5_2b, y5_5_2b, '-o'); grid;
title('Plot of 5.5.2b RKF solution'); xlabel('t'); ylabel('y(t)');
saveas(gcf,'5_5_2b.png');

%%% Part (c) %%%

% setup given IVP
f5_5_2c = @(t,y) (y.^2 +y)./t;
t = 1;
tend = 3;
w = -2;
hmax = 0.5;
hmin = 0.02;

% initializations
h = hmax;
y5_5_2c = w;
t5_5_2c = t;

% main algorithm loop
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

% write out to csv
csvMc = table(t5_5_2c', y5_5_2c', 'VariableNames', {'t', 'y(t)'});
writetable(csvMc, '5_5_2c.csv');

% plot to png
figure(3)
plot(t5_5_2c, y5_5_2c, '-o'); grid;
title('Plot of 5.5.2c RKF solution'); xlabel('t'); ylabel('y(t)');
saveas(gcf,'5_5_2c.png');

%%% Part (d) %%%

% setup given IVP
f5_5_2d = @(t,y) t.^2;
t = 0;
tend = 2;
w = 0;
hmax = 0.5;
hmin = 0.02;

% initializations
h = hmax;
y5_5_2d = w;
t5_5_2d = t;

% main algorithm loop
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

% write out to csv
csvMd = table(t5_5_2d', y5_5_2d', 'VariableNames', {'t', 'y(t)'});
writetable(csvMd, '5_5_2d.csv');

% plot to png
figure(4)
plot(t5_5_2d, y5_5_2d, '-o'); grid;
title('Plot of 5.5.2d RKF solution'); xlabel('t'); ylabel('y(t)');
saveas(gcf,'5_5_2d.png');
