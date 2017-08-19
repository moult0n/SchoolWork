from matplotlib.pyplot import * 

def f(t,y,params):
	u,v = y
	a,b,c,d = params 
	dudt = a*u-b*u*v
	dvdt = c*u*v-d*v
	return array([dsdt,didt])

def myeuler(f,tspan,y0,N,params):
	h = float(tspan[1]-tspan[0])/N 
	t = tspan[0]; y = y0
	tout = [0]*(N+1); yout = [0]*(N+1) 
	tout[0] = t; yout[0] = y 
	for n in range(1,N+1): 
		f1 = f(t,y,params) 
		t += h 
		y += h*f1 
		tout[n] = t; yout[n] = y
	return tout,yout

def odesolve(f,tspan,y0,N,params):
	from scipy.integrate import ode
	r = ode(f)
	r.set_integrator('vode',rtol=1e-6) 
	h = float(tspan[1]-tspan[0])/N 
	t = [0]*(N+1); y = [0]*(N+1) 
	n = 0
	r.set_initial_value(y=y0,t=tspan[0]) 
	r.set_f_params(params) 
	t[0] = r.t; y[0] = r.y;
	while r.successful() and n < N:
		r.integrate(r.t+h) 
		n += 1; t[n] = r.t; y[n] = r.y; 
	return t,y

tspan = [0.,20.]
y0 = u0,v0 = [10.,60.] 
params = a,b,c,d = [.8,.01,.6,.1] 
N = 100 
t,y = odesolve(f,tspan,y0,N,params)
t = t[:,0]; u = y[:,0]; v = y[:,1]; 
N = 50 
t1,y1 = myeuler(f,tspan,y0,N,params)
t1 = t1[:,0]; u1 = y1[:,0]; v1 = y1[:,1];

close() 
figure(1)
subplot(2,1,1) 
plot(t,u,'b-',t1,u1,'bo',t,v,'r-',t1,v1,'ro',linewidth=2,markersize=5)
legend([r'$u(t)$','Euler',r'$v(t)$','Euler'])
axis(tspan+[0.,1.]) 
grid('on')
subplot(2,1,2) 
plot(u,v,'k-',u1,v1,'ro',linewidth=2,markersize=5)
legend(['exact','Euler'],loc='best')
xlabel(r'$u$')
ylabel(r'$i$')
axis([0.,.7,0.,.2])
grid('on')
savefig('u_and_v.eps') 
show()
