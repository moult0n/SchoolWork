f = @(x, y) y-x;
y0 = 2;
x = [0 1];
h = .1;
[sol, y] = rungeKutta(f,h,x,y0)
