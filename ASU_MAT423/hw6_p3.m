f = @(x, y) y^2+1;
y0=0;
x=[0 1];
h =.1;
disp('Heuns kickstater')
y1 = heunsMethod(f,h,[x(1), x(1)+h], y0)
disp('Solution')
[sol, y] = nystromsMethod(f,h,x,y0,y1)