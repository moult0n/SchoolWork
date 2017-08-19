function [x,v,t_mesh]=RK4_solver(x0, v0, tspan, G, m, N)
f = @(t,x,v) nBodyModel(x,v,m,G);
h = (tspan(2)-tspan(1))/N;
t_mesh = tspan(1):h:tspan(2);
x(:,:,1) = x0;
v(:,:,1) = v0;
for k = 2:N+1
    [k1dx, k1dv] = f(t_mesh,x(:,:,k-1),v(:,:,k-1));
    [k2dx, k2dv] = f(t_mesh+h/2,x(:,:,k-1)+k1dx*h/2,v(:,:,k-1)+k1dv*h/2);
    [k3dx, k3dv] = f(t_mesh+h/2,x(:,:,k-1)+k2dx*h/2,v(:,:,k-1)+k2dv*h/2);
    [k4dx, k4dv] = f(t_mesh+h,x(:,:,k-1)+k3dx*h,v(:,:,k-1)+k3dv*h);
    x(:,:,k) = x(:,:,k-1)+h*(1/6)*(k1dx+2*k2dx+2*k3dx+k4dx);
    v(:,:,k) = v(:,:,k-1)+h*(1/6)*(k1dv+2*k2dv+2*k3dv+k4dv);
end
end