function [t,y] = impeuler(f,tspan,y0,N)
m = length(y0);
t0 = tspan(1);
tf = tspan(2);
h = (tf-t0)/N;             % evaluate the time step size
t = linspace(t0,tf,N+1);    % create the vector of t values
y = zeros(m,N+1);   % allocate memory for the output y
y(:,1) = y0';              % set initial condition
for n=1:N
    f1 = f(t(n),y(:,n));
    f2 = f(t(n+1),y(:,n)+h*f1);
    y(:,n+1) = y(:,n) + (h/2)*(f1+f2);
end
t = t'; y = y';    % change t and y from row to column vectors
end