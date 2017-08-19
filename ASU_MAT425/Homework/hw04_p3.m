f = @(t,y) t-y.^2;
y0 = 0;
h = 1;
step = .001;
dt = 0:step:2;
dy = y0-h:step:y0+h;
sol = max(f(dt,dy))
% all wrong
