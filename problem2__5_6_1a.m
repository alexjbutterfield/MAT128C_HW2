format long
f2 = @(t,y) t.*exp(3*t) - 2*y;
sol = @(t) t.*exp(3*t)./5 - exp(3*t)./25 + exp(-2*t)./25;
tend = 1;
h = 0.2;
t2 = linspace(0,1,6);
w2 = zeros(6,5);
for i = 1:5
   w2(1:i,i) = sol(h*(0:(i-1)));
   t = h*(i-1);
   j = 1;
   while t < tend
       [t,w_next] = AdamsBashforthN(f2,t,w2(j:(i+j-1),i),h);
       w2(i+j,i) = w_next;
       j = j+1;
   end
end
err2 = abs(repmat(sol(t2)',1,5) - w2);