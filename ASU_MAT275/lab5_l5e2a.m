function l5e2a
m = 1;                                   
k = 16;                                   
omega0=sqrt(k/m);            
y0=0.1; v0=0;                            
[t,Y]=ode45(@f,[0:.1:10],[y0,v0],[],omega0);  
y=Y(:,1); v=Y(:,2);
e=.5*m*v.^2+.5*k*y.^2;
figure(1); plot(t,e,'b-');
axis([0 10 .05 .1]);
title('Energy of Mass-Spring System');
grid on;
%------------------------------------------------------
function dYdt= f(t,Y,omega0)
y = Y(1); v= Y(2);
dYdt = [v; -omega0^2*y];