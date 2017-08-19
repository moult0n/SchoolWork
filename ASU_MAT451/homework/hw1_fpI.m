function [x,x0] = fpI(limit, x0,f)
step=0;
x_old = x0+100;
x = [step, x0];
while step < 60 
    x_old = x0;
    x0 = f(x0);
    step = step+1;
    x = [x; step, x0];
end
end

