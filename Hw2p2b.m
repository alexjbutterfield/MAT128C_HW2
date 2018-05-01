% Step 2
t0 = 0;
b = 1;
w0 = 0; 
hmin = 0.01;
hmax = 0.2;
h = hmax; 
TOL = 10^(-4);
FLAG = 1;
LAST = 0; 
f = @(t,y) sin(t) + exp(-t);

% Step 3
[t, w] = rk4(h,w0,t0);

t = [t0; t];
w = [w0; w];

NFLAG = 1; 
i = 5;
tt = t(3) + h; 

while FLAG == 1 % Step 4
    
    % Step 5
    WP = w(i-1) + (h/24)*(55*f(t(i-1),w(i-1))-59*f(t(i-2),w(i-2))+37*f(t(i-3),w(i-3))-9*f(t(i-4),w(i-4)));
    WC = w(i-1) + (h/24)*(9*f(tt,WP)+19*f(t(i-1),w(i-1))-5*f(t(i-2),w(i-2))+f(t(i-3),w(i-3)));
    sigma = 19*abs(WP-WC)/(270*h);
   % Step 6
    if sigma < TOL 
       % Step 7
       w(i) = WC;
       t(i) = tt;
       % Step 8
       if NFLAG == 1
           for j = i-3:i
               disp([j, t(j), w(j), h]);
               break;
           end
       else
           disp([i,t(i),w(i),h]);
           break;
       end
       % Step 9 
       if LAST == 1
           FLAG = 0;            
       else
           % Step 10
           i = i + 1;
           NFLAG = 0;  
           
           % Step 11
           if sigma <= 0.1 || t(i-1) + h > b
               % Step 12
               q = (TOL/(2*sigma))^(1/4);
               % Step 13
               if q > 4
                   h = 4*h;
               else
                   h = q*h;
               end
               
               % Step 14
               if h > hmax
                   h = hmax;
               end
               
               % Step 15
               if t(i-1) + 4*h > b
                   h = (b-t(i-1))/4;
                   LAST = 1;
               end
               
               % Step 16
               [t(i:i+2),w(i:i+2)] = rk4(h,w(i-1),t(i-1));
                NFLAG = 1;
                i = i + 3; 
           end
           
       end
    else
        % Step 17
        q = (TOL/(2*sigma))^(1/4);
        % Step 18
        if q < 0.1
            h = 0.1*h;
        else
            h = q*h;
        end
        % Step 19 
        if h < hmin
            FLAG = 0;
            OUTPUT = "hmin exceeded";
        else
            if NFLAG == 1
                i = i - 3;
                [t(i:i+2),w(i:i+2)] = rk4(h,w(i-1),t(i-1));
                i = i + 3;
                NFLAG = 1;
            end
        end

    end
   % Step 20
   tt = t(i-1) + h;
end               