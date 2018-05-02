format long
f7 = @(x,y) 2*exp(-x.^2)./sqrt(pi);
tspan = [0 2];
y0 = erf(0);
opts = [odeset('Reltol',1e-1) odeset('Reltol',1e-4) odeset('Reltol',1e-7) odeset('Reltol',1e-10) odeset('Reltol',1e-13)];
y7 = zeros(5,3,100);
t7 = zeros(5,3,100);
tsizes = zeros(5,3);
comptimes = zeros(5,3);
for j = 1:5
    
    tic
    [t, y] = ode23(f7,tspan,y0, opts(j));
    comptimes(j,1) = toc;
    tsizes(j,1) = size(t,1);
    t7(j,1,1:tsizes(j,1)) = t;
    y7(j,1,1:tsizes(j,1)) = y;
    
    tic
    [t, y] = ode45(f7,tspan,y0, opts(j));
    comptimes(j,2) = toc;
    tsizes(j,2) = size(t,1);
    t7(j,2,1:tsizes(j,2)) = t;
    y7(j,2,1:tsizes(j,2)) = y;
    
    tic
    [t, y] = ode113(f7,tspan,y0, opts(j));
    comptimes(j,3) = toc;
    tsizes(j,3) = size(t,1);
    t7(j,3,1:tsizes(j,3)) = t;
    y7(j,3,1:tsizes(j,3)) = y;
end

err7 = zeros(5,3,100);
err7 = abs(y7 - erf(t7));

for i = 1:5
   figure(i)
   hold on;
   for j = 1:3
      plot(squeeze(t7(i,j,1:tsizes(i,j))), log10(squeeze(err7(i,j,1:tsizes(i,j)))));
   end
   title(['Log10(error) for tolerance ',num2str(opts(i).RelTol)]);
   legend('ode23','ode45','ode113');
   hold off;
end

figure(6)
hold on;
bar(categorical(-log10(abs([opts(1:5).RelTol]))), tsizes);
title('Steps to converge');
legend('ode23','ode45','ode113');
hold off;

figure(7)
hold on;
bar(categorical(-log10(abs([opts(1:5).RelTol]))), comptimes);
title('Computation time');
legend('ode23','ode45','ode113');
hold off;