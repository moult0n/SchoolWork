clear
clc
format long
f = @(x, y) y^2+1;
y0=0;
x=[0 1];
sol = zeros(1,5);
[m, n] = size(sol);
h = [1 .1 .01 .001 .0001];
disp('RK3')
for i=1:n
    [sol(i), y] = rungeKutta(f,h(i),x,y0);
    disp(sol(i))
end
rk3sol = sol;
sol = zeros(1,5)
disp('RK4')
for i=1:n
    [sol(i), y] = rungeKuttaO4(f,h(i),x,y0);
    disp(sol(i))    
end
rk4sol = sol;
disp('Solution')
rk4sol(2)
disp('Actual Solution')
tan(1)
disp('Percent Accuracy')
rer = (abs(rk4sol(2)-tan(1))/tan(1))*100