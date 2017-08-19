clear
clc
format long

f = @(t,y) y;
y0=1;
dt = [.1 .05 .02 .01 .005 .002 .0001];
tspan = [0 1];

[y1, t1, sol1] = RK3(f,dt(1),tspan,y0); yE1=exp(t1); yER1 = abs(sol1-exp(1));
[y2, t2, sol2] = RK3(f,dt(2),tspan,y0); yE2=exp(t2); yER2 = abs(sol2-exp(1));
[y3, t3, sol3] = RK3(f,dt(3),tspan,y0); yE3=exp(t3); yER3 = abs(sol3-exp(1));
[y4, t4, sol4] = RK3(f,dt(4),tspan,y0); yE4=exp(t4); yER4 = abs(sol4-exp(1));
[y5, t5, sol5] = RK3(f,dt(5),tspan,y0); yE5=exp(t5); yER5 = abs(sol5-exp(1));
[y6, t6, sol6] = RK3(f,dt(6),tspan,y0); yE6=exp(t6); yER6 = abs(sol6-exp(1));
[y7, t7, sol7] = RK3(f,dt(7),tspan,y0); yE7=exp(t7); yER7 = abs(sol7-exp(1));

%%
plot(t1,y1,t2,y2,t3,y3,t4,y4,t5,y5,t6,y6,t7,y7)
xlabel('t')
ylabel('y')
%%
loglog(dt,[yER1,yER2,yER3,yER4,yER5,yER6,yER7],'o-')
grid on
xlabel('$\bigtriangleup$t', 'Interpreter', 'Latex')
ylabel('Error')

slope=(yER1-yER7)/(dt(1)-dt(7))
%%
sol1
sol2
sol3
sol4
sol5
sol6
sol7
