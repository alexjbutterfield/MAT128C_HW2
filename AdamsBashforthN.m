% Adams-Bashforth methods
function [t,w_next] = AdamsBashforthN(f,t,wbuf,h)
    Nsteps = size(wbuf,1);
    switch Nsteps
        case 1
            w_next = wbuf(1) + h*f(t,wbuf(1));
        case 2
            w_next = wbuf(2) + h*(3*f(t,wbuf(2)) - f(t-h,wbuf(1)))./2;
        case 3
            w_next = wbuf(3) + h*(23*f(t,wbuf(3)) - 16*f(t-h,wbuf(2)) + 5*f(t-2*h, wbuf(1)))./12;
        case 4
            w_next = wbuf(4) + h*(55*f(t,wbuf(4)) - 59*f(t-h,wbuf(3)) + 37*f(t-2*h, wbuf(2)) - 9*f(t-3*h, wbuf(1)))./24;
        case 5
            w_next = wbuf(5) + h*(1901*f(t,wbuf(5)) - 2774*f(t-h,wbuf(4)) +2616*f(t-2*h,wbuf(3)) - 1274*f(t-3*h,wbuf(2)) +251*f(t-4*h,wbuf(1)))./720;
        otherwise
            disp([num2str(Nsteps) ' step Adams-Bashforth method not implemented'])
    end
    t = t+h;
end