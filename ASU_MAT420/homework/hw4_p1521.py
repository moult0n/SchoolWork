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

p = lambda x: x**2-2
dp = lambda x: 2*x
x0 = 1.
tol = 1e-14
maxiter = 100
root = newton(p,dp,x0,tol,maxiter)
print 'root=%.16f in iterations %i' % root

		
		
