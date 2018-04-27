% RKF.m takes a function f(t,y) = y', the current time t, the previous
% approximation w, a time-step h, and a tolerance tol, and iterates through
% one application of RKF, returning the next time, the next w, and the next
% h.
%
% Example use:
% while (t + h)<tend
%    [t,w,h] = RKF(f,t,w,h,tol);
%    if h > hmax
%       h = hmax;
%    end
%    % Store values in some table/array/matrix
% end
% h = t - tend;
% % check hmin
% [t,w,h] = RKF(f, t, w, h, tol);
% % Store final values in table/array/matrix
%
% Note:
% t, tend, hmax, hmin, w, h, tol, and f are defined earlier according to the the
% specific IVP
%
% (c) Adam Kagel 2018
function [t,w,h] = RKF(f,t,w,h,tol)
    K1 = h.*f(t,w);
    K2 = h.*f(t+h./4, w + K1./4);
    K3 = h.*f(t+3*h./8, w + 3*K1./32 + 9*K2./32);
    K4 = h.*f(t+12*h./13, w + 1932*K1./2197 - 7200*K2./2197 + 7296*K3./2197);
    K5 = h.*f(t+h, w + 439*K1./216 - 8*K2 + 3680*K3./513 - 845*K4./4104);
    K6 = h.*f(t+h./2, w - 8*K1./27 + 2*K2 -3544*K3./2565 + 1859*K4./4104 -11*K5./40);
    R = abs(K1./360 - 128*K3./4275 - 2197*K4./75240 + K5./50 + 2*K6./55)./h;
    if R < tol
        t = t + h;
        w = w + 25*K1./216 + 1408*K3./2565 + 2197*K4./4104 -K5./5;
    else
        delta = 0.84*(tol./R).^(1/4);
        if delta < 0.1
            h = 0.1*h;
        elseif delta > 4
            h = 4*h;
        else
            h = delta*h;
        end
    end
end