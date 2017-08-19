f = @(t,y) cos(1+2*y);
y0 = 1;
h = 2;5
step = 1; %should be .04

h1 = .0001; a = 0; b = 5;
% sol = max(abs(arrayfun(@(x) midpoint(f, x, h1), a:h1:b))); %used to find max|f''(Xi)|

disp(h1)
x = [a,b];
tic
[z, y, t] = forawrdEuler(f,step,x,y0);
toc
tic
[zact, yact, meshact] = rungeKuttaO4(f,h1,x,y0);
toc

plot(meshact,yact,'b-',t,y,'r-')

