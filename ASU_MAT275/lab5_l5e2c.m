function l5e2c
m = 1;                                   
k = 16;                                   
omega0=sqrt(k/m);            
y0=0.1; v0=0;                            
[t,Y]=ode45(@f,[0:.1:10],[y0,v0],[],omega0);  
y=Y(:,1); v=Y(:,2);
figure(1); plot(v,y,'b-');
title('Phase Plot of v vs y');
grid on;
%------------------------------------------------------
function dYdt= f(t,Y,omega0)
y = Y(1); v= Y(2);
dYdt = [v; -omega0^2*y];