f = @(x) sqrt(x^2+1);
x=0;
step=0;
x_old = 100;
while step < 100
    x_old = x;
    x = f(x)
    step = step+1;
end

