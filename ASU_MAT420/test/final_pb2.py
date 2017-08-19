from matplotlib import * 
use('Agg')
from matplotlib.pyplot import *

def f(y,t,params):
	u,v = y
	a,b,c,d = params 
	dudt = (a*u)-(b*u*v)
	dvdt = (c*u*v)-(d*v)
	return dudt,dvdt

def myeuler(f,tspan,y0,N,params):
        h = float(tspan[1]-tspan[0])/N
        t = tspan[0]
        u = y0[0]
	v = y0[1]
        tout = [0]*(N+1)
        uout = [0]*(N+1)
	vout = [0]*(N+1)
        tout[0] = t
        uout[0] = u
	vout[0] = v
        for n in range(1,N+1):
                f1 = f(y0,t,params)
                t += h
                u += h*f1[0]
		v += h*f1[1]
                tout[n] = t
                uout[n] = u
		vout[n] = v
		y0 = [u,v]
        return tout,uout,vout

tspan = [0.,20.]
y0 = u0,v0 = [10.,60.] 
params = a,b,c,d = [.8,.01,.2,.4] 
N = 1000 
t1,u1,v1 = myeuler(f,tspan,y0,N,params)
close()
figure(1)
plot(t1,u1,'b-',t1,v1,'r-',linewidth=2,markersize=5)
axis(tspan+[0.,300.])
grid('on')
savefig('p1721auvt.eps')
show()
close()
figure(2)
plot(u1,v1,'k-',linewidth=2,markersize=5)
grid('on')
axis(tspan+[0.,300.])
savefig('p1721buvt.eps')
show()
