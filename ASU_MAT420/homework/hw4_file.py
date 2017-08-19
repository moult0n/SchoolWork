def chebyshev(N,x,kind=1):
	a,b = 1.0*.0*x,kind*x
	for n in range(N):
		a,b = b,2.0*x*b-a
	return a

def newton1d(p,dp,x0,tol=1e-14,maxiter=1000):
	x = x0
	r = -p(x)
	iter = 0
	while abs(r)>tol and iter<maxiter:
		d = dp(x)
		x += r/d
		r = -p(x)
		iter += 1
	return x,iter
