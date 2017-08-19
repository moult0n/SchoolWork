function l6e1b
omega0 = 2; c = 1; omega = 1.4;
alpha = atan(omega/(omega0^2-(omega^2)));
param = [omega0,c,omega];
t0 = 0; y0 = 0; v0 = 0; Y0 = [y0;v0]; tf = 50;
options = odeset('AbsTol',1e-10,'relTol',1e-10);
[t,Y] = ode45(@f,[t0,tf],Y0,options,param);
y = Y(:,1); v = Y(:,2);
t1 = 25; i = find(t>t1);
C = (max(Y(i,1))-min(Y(i,1)))/2;
Ctheory = 1/sqrt((omega0^2-omega^2)^2+(c*omega)^2);
yc = y-C*cos(omega*t-alpha);
figure(1)
plot(t,yc,'b-'); ylabel('yc'); grid on;
%----------------------------------------------------------------
function dYdt = f(t,Y,param)
y = Y(1); v = Y(2);
omega0 = param(1); c = param(2); omega = param(3);
dYdt = [ v ; cos(omega*t)-omega0^2*y-c*v ];