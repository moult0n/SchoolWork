function l6e3a
omega0 = 2; c = 0;
OMEGA = 1:0.02:3;
C = zeros(size(OMEGA));
Ctheory = zeros(size(OMEGA));
t0 = 0; y0 = 0; v0 = 0; Y0 = [y0;v0]; tf = 50; t1 = 25;
for k = 1:length(OMEGA)
    omega = OMEGA(k);
    param = [omega0,c,omega];
    [t,Y] = ode45(@f,[t0,tf],Y0,[],param);
    i = find(t>t1);
    C(k) = (max(Y(i,1))-min(Y(i,1)))/2;
    Ctheory(k) = 1/sqrt(((omega0.^2)-(omega.^2))^2+((c.*omega).^2));
end
figure(2)
plot(OMEGA,Ctheory,'k-',OMEGA,C,'ro-'); grid on;
xlabel('\omega'); ylabel('C');
%---------------------------------------------------------
function dYdt = f(t,Y,param)
y = Y(1); v = Y(2);
omega0 = param(1); c = param(2); omega = param(3);
dYdt = [ v ; cos(omega*t)-omega0^2*y-c*v ];
