function [x,v,t_mesh]=BE_solver(x0, v0, tspan, G, m, N)
f = @(t,x,v) nBodyModel(x,v,m,G);
h = (tspan(2)-tspan(1))/N;
t_mesh = tspan(1):h:tspan(2);
x(:,:,1) = x0;
v(:,:,1) = v0;
for k = 2:N+1
    [dx, dv] = f(t_mesh,x(:,:,k-1),v(:,:,k-1));
    x(:,:,k) = x(:,:,k-1)+h.*dx;
    v(:,:,k) = v(:,:,k-1)+h.*dv;
end
end