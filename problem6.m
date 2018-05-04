format long
tol = [10^(-7) 10^(-11)]; % store desired tolerances
f8 = @(t,y) (-1/25)*((t-2).^3).*y.^2; % function definition
tend = 5.0; % set endpoint
hmax = 0.1; % set hmax (also intial h)
hmin = 0; % kind of redundant

% loops once for each tolerance
for i = 1:2
    j = 2;
    t = -5.0; % set begining (a)
    w = 100/((-5-2).^4 + 1); % initial condition
    y8(1,i) = w; % initialize first values of y
    t8(1,i) = t; % initialize first values of t
    h = hmax; % set initial h to hmax
    h8(1,i) = h; % store h value
    
    % primary algorithm loop
    while (t + h)< tend
        [t,w,h] = RKF(f8, t, w, h, tol(i)); % one step of RKF method
        % check to see if h increased above hmax. If so, set equal to max.
        if h > hmax
            h = hmax;
        end
        y8(j,i) = w; % store new w value
        t8(j,i) = t; % store new t value
        h8(j,i) = h; % store new step
        j = j+1; % set next storage point
    end
    h = tend - t; % make sure to end at tend
    if h < hmin % redundant code since hmin = 0
        disp('minimum h exceeded');
    else
        [t,w,h] = RKF(f8, t, w, h, tol(i)); % last setp
        
        % storing last values
        y8(j,i) = w;
        t8(j,i) = t;
        h8(j,i) = h;
    end
end

% _low refers to 10^-7 tolerance
t8_low = t8(1:668,1);
y8_low = y8(1:668,1);
h8_low = h8(1:668,1);

% plot _low tolerance solution versus high tolerance solution
figure(1)
plot(t8_low,y8_low);
hold on
plot(t8(:,2),y8(:,2));
hold off

% plot _low tolerance steps versus high tolerance steps
figure(2)
plot(t8_low,h8_low);
hold on
plot(t8(:,2),h8(:,2));
hold off