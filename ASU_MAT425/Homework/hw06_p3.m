clear
clc

f = @(t,x) [x(2);-4*x(1)^3+4*x(1)];
E = @(x,y) .5*y.^2+x.^4-2.*x.^2;

c = 2;
d = 2;
t0 = 0;
tf = 10;
h = (tf-t0)/100000;
[t45,y45] = ode45(f,[t0 tf], [c d]);
disp('ODE45 solution')
plot(t45,y45)
%%
e45 = E(y45(:,1),y45(:,2));
disp('ODE45 energy')
plot(t45,e45)
%%
xSE = c;
ySE = d;
dtSE = h;
tSE = t0:dtSE:tf;
[m,n] = size(tSE);
for i=1:n-1
    [x1SE,y1SE] = SympEuler(xSE(i),ySE(i),dtSE);
    xSE = [xSE, x1SE];
    ySE =[ySE, y1SE];
end
disp('Symplectic Euler solution')
plot(tSE,xSE,tSE,ySE)
%%
eSE=E(xSE,ySE);
disp('Symplectic Euler energy')
plot(tSE,eSE)
%%
x = c;
y = d;
dt = h;
t = t0:dt:tf;
[m,n] = size(t);
for i=1:n-1
    [x1,y1] = Euler(x(i),y(i),dt);
    x = [x, x1];
    y =[y, y1];
end
disp('Euler solution')
plot(t,x,t,y)
%%
e=E(x,y);
disp('euler energy')
plot(t,e)
%%
plot(t,e,tSE,eSE,t45,e45)
legend('Euler','Symplectic Euler','ODE45','location','Northwest')
xlabel('Time')
ylabel('Energy')