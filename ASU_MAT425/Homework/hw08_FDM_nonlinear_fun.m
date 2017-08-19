function [Y, x] = FDM_nonlinear_fun(F,DF, bc, tspan,n)
a = tspan(1); b = tspan(2);
alpha = bc(1); beta = bc(2);
N = n-1;
dx = 1/(N+1);
x  = a+dx*(1:N);
nbIterations = 5;
stockY = zeros(nbIterations+1,N);
Y = 1+x';		
L = 2*diag(ones(1,N)) - diag(ones(1,N-1),1) - diag(ones(1,N-1),-1);
vecBC = [alpha; zeros(N-2,1); beta];
stockY(1,:) = Y';
for k=1:nbIterations
  DJ = L + dx^2*DF(Y);
  Y  = Y - DJ\ (L*Y + dx^2*F(Y)- vecBC);
  stockY(k+1,:) = Y';
end
x = [a, x, b];
Y = [alpha Y' beta];
end
