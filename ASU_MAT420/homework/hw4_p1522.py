def newton(p, dp, x0, tol, maxiter):
	x = x0
	xOld = 100
	iter = 0
	while abs(xOld-x)>tol and iter<maxiter:
		xOld = x
		x -= p(x)/dp(x)
		print 'Iteration: %i' % iter 
		print '= %.16f' % x
		iter += 1
	return x,iter

p = lambda x: 35*x**4/8-15*x**2/4+3/8
dp = lambda x: 35*x**3/2-15*x/2
x0 = .5
tol = 1e-14
maxiter = 100
root = newton(p,dp,x0,tol,maxiter)
print 'root=%.16f in iterations %i' % root
