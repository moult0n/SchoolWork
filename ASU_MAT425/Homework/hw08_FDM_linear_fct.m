function [y_sol,x]=FDM_linear_fct(N,p,q,r,a,b,alpha,beta)
  %% Solve the BVP with the finite difference method
  %%   y'' = p(x) y' + q(x) y + r(x)
  %%   y(0)= α, y(b)= β
  
  %% Parameters
  dx = 1/(N+1);
  x  = a+dx*(1:N);

  %% Initialization
  A = diag(2+dx^2*q(x)) - diag(1+dx/2*p(x(2:N)),-1) - diag(1-dx/2*p(x(1:(N-1))),1);
  vecB = -dx^2*r(x');
  %% boundary condition
  vecB(1) = vecB(1) + (1+dx/2*p(x(1)))*alpha;
  vecB(N) = vecB(N) + (1-dx/2*p(x(N)))*beta;

  %%----------------------------%%
  %%-----       solve        ---%%
  %%----------------------------%%
  Y=A\vecB;
  %% boundary condition
  y_sol = [alpha Y' beta];
  x     = [a x b];
end
