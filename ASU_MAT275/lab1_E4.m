x=linspace(0,pi,1000);
y=cos(x);
z=1-.5*(x.^2)+(1/24)*(x.^4);
plot(x,y,'r-',x,z,'b--')
grid on;
legend ('y(x)','z(x)');