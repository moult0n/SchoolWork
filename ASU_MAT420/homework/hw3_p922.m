
eps = 2.2204460492503131*10^(-16);
f=0:.01:1;
x=100+100*f*eps;
y=x-100;
z=y/(100*eps);
plot(f,z,'r-')
