function l5e4c
m = 1;                         
k = 4;                         
c = 1;                         
omega0 = sqrt(k/m);  p = c/(2*m);
y0 = 0.1; v0 = 0;              
[t,Y]=ode45(@f,[0,10],[y0,v0],[],omega0,p); 
y=Y(:,1); v=Y(:,2); 
figure(1); plot(v,y,'b-');       
grid on
%------------------------------------------------------
function dYdt= f(t,Y,omega0,p)
y = Y(1); v= Y(2);
dYdt = [v; -omega0.^2*y-2*p*v ];                     