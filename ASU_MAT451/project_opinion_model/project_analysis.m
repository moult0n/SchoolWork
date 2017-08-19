%% Variables
cnx = .4; cny = .3; cyx = .1; cxy = .1;
c = [cnx cny cyx cxy];
P = 10000; 
x0 = [500, 0];

f = @(t, x) opinion_model(x,c,P);

%% Solution
[tout,yout] = ode45(f,[0 100],x0);
u = P-yout(:,1)-yout(:,2);

%% Plot
plot(tout,yout(:,1),tout,yout(:,2),tout,u)
grid on
legend('x','y','undecided')