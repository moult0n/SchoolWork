function LAB05ex1a
m = 1;                         % mass [kg]
k = 4;                         % spring constant [N/m]
c = 1;                         % friction coefficient [Ns/m]
omega0 = sqrt(k/m);  p = c/(2*m);
y0 = 0.1; v0 = 0;              % initial conditions
[t,Y]=ode45(@f,[0,10],[y0,v0],[],omega0,p); % solve for 0<t<10
y=Y(:,1); v=Y(:,2);                         % retrieve y, v from Y
figure(1); plot(t,y,'b+-',t,v,'ro-');       % time series for y and v
grid on

for i=1:length(y) 
    m(i)=max(abs(y(i:end))); 
end
i = find(m<0.01);
i = i(1); 
disp(['|y|<0.01 for t>t1 with ' num2str(t(i-1)) '<t1<' num2str(t(i))])

%------------------------------------------------------
function dYdt= f(t,Y,omega0,p)
y = Y(1); v= Y(2);
dYdt = [v; -omega0.^2*y-2*p*v ];                     % fill-in dv/dt