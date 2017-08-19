from file import chebyshev, newton1d
p = lambda x: chebyshev(4,x,kind=1)
dp = lambda x: 4*chebyshev(3,x,kind=2)
x0 = 0.5; tol = 1e-15; maxiter = 10
root = newton1d(p,dp,x0,tol,maxiter)
print 'root = %.16f in %i iterations' % root
