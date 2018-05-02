format long
tol = [10^(-7) 10^(-11)];
f8 = @(t,y) (-1/25)*((t-2).^3).*y.^2;
tend = 5.0;
hmax = 0.1;
hmin = 0;
for i = 1:2
    j = 2;
    t = -5.0;
    w = 100/((-5-2).^4 + 1);
    y8(1,i) = w;
    t8(1,i) = t;
    h = hmax;
    h8(1,i) = h;
    while (t + h)< tend
        [t,w,h] = RKF(f8, t, w, h, tol(i)); 
        if h > hmax
            h = hmax;
        end
        y8(j,i) = w;
        t8(j,i) = t;
        h8(j,i) = h;
        j = j+1;
    end
    h = tend - t;
    if h < hmin
        disp('minimum h exceeded');
    else
        [t,w,h] = RKF(f8, t, w, h, tol(i));
        y8(j,i) = w;
        t8(j,i) = t;
        h8(j,i) = h;
    end
end

t8_low = t8(1:668,1);
y8_low = y8(1:668,1);
h8_low = h8(1:668,1);

figure(1)
plot(t8_low,y8_low);
hold on
plot(t8(:,2),y8(:,2));
hold off

figure(2)
plot(t8_low,h8_low);
hold on
plot(t8(:,2),h8(:,2));
hold off