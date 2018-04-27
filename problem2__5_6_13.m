t = 0;
tend = 0.20;
h = 0.01;
w2__5_6_13 = zeros(21,1);
w2__5_6_13(1:3) = 1 - log(1 -exp(1)*(t+(0:2).*h));
tol = 1e-6;
for i = 3:20
   w_old = w2__5_6_13(i);
   w_new = w2__5_6_13(i) + h.*(9*exp(w_old)+19*exp(w2__5_6_13(i))-5*exp(w2__5_6_13(i-1))+exp(w2__5_6_13(i-2)))./24;
   while abs(w_old - w_new) > tol
       w_old = w_new;
       w_new = w2__5_6_13(i) + h.*(9*exp(w_old)+19*exp(w2__5_6_13(i))-5*exp(w2__5_6_13(i-1))+exp(w2__5_6_13(i-2)))./24;
   end
   w2__5_6_13(i+1) = w_new;
end
%plot(t:h:tend, w2__5_6_13);
err2__5_6_13 = abs(w2__5_6_13 - (1 - log(1 -exp(1)*(t:h:tend)')));
plot(t:h:tend, err2__5_6_13);