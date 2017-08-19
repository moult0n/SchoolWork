syms y(t)
[V] = odeToVectorField(diff(y, 2) == (-2*t^2)*diff(y) - y + t)
M = matlabFunction(V,'vars', {'t','Y'})
[t, y]  = ode45(M,[0 .2],[0 1])
