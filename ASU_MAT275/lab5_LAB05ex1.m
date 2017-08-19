function LAB05ex1
m = 1;                                   % mass [kg]
k = 16;                                   % spring constant [N/m]
omega0=sqrt(k/m);            
y0=0.1; v0=0;                            % initial conditions
[t,Y]=ode45(@f,[0:.01:10],[y0,v0],[],omega0);  % solve for 0<t<10
y=Y(:,1); v=Y(:,2);                        % retrieve y, v from Y
figure(1); plot(t,y,'b-',t,v,'r-');    % time series for y and v
title('m=1,k=16');
grid on;
%------------------------------------------------------
function dYdt= f(t,Y,omega0)
y = Y(1); v= Y(2);
dYdt = [v; -omega0^2*y];