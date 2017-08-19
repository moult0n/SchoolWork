%% Solve the elliptic PDE
%%    ∂_x^2 u + ∂_y^2 u  =  f    on Ω=[a,b]×[c,d]
%%          u = g                on ∂Ω

%% the functions
f = @(x,y) 4;
g = @(x,y) (x-y)^2;

%% domain Ω=[a,b]×[c,d]
a = 0; b = 1;
c = 0; d = 2;

%% numerical parameters
n = 70; dx = (b-a)/n;
m = 60; dy = (d-c)/m;
nIterMax = 1000;
TOL = 10^(-10);
%% init
ld = dx^2/dy^2;
error = 10*TOL;
nIter = 0;

%%----------- initialization
%%-- matB
matB = zeros(n-1,m-1);
for i=1:(n-1)
  for j=1:(m-1)
    %% init
    xi   = a + i*dx;
    yj   = c + j*dy;
    %% the vector b
    matB(i,j) = dx^2*f(xi,yj);
  end
end
%%-- u
u     = zeros(n-1,m-1);
u_new = zeros(n-1,m-1);
uBC   = zeros(n+1,m+1);
%% boundary condition
%%-- i=1 (x=a) and i=n+1 (x=b)
for j=1:(m+1)
  yj = c + (j-1)*dy;
  uBC(1,j)   = g(a,yj);
  uBC(n+1,j) = g(b,yj);
end
%%-- j=1 (y=c) and j=m+1 (y=d)
for i=1:(n+1)
  xi = a + (i-1)*dx;
  uBC(i,1)   = g(xi,c);
  uBC(i,m+1) = g(xi,d);
end
  

%%-----------------------------------------%%
%%---     Solution iterative method     ---%%
%%-----------------------------------------%%

tic

## while (error>TOL && nIter<nIterMax)
##   %% compute the new U: U^new = D^-1(b-RU)
##   for i=1:(n-1)
##     for j=1:(m-1)
##       %% inside
##       u_new(i,j) = -1/(2+2*ld)*(  matB(i,j) - uBC(i+1+1,j+1) - uBC(i-1+1,j+1) - ld*uBC(i+1,j+1+1) - ld*uBC(i+1,j-1+1)  );
##     end
##   end
##   %% update
##   error = max(max(abs(u_new-u)));
##   u     = u_new;
##   uBC(2:n,2:m) = u; 
##   nIter = nIter+1;
## end

while (error>TOL && nIter<nIterMax)
  u_new = -1/(2+2*ld)*(matB - uBC(3:end,2:m) - uBC(1:(end-2),2:m) - ld*uBC(2:n,3:end) - ld*uBC(2:n,1:(end-2)));
  %% update
  error = max(max(abs(u_new-u)));
  u     = u_new;
  nIter = nIter+1;
  uBC(2:n,2:m) = u; 
end

toc

%%-----------------------------------------%%
%%-----------------------------------------%%


%%-- plot
x = linspace(a,b,n+1);
y = linspace(c,d,m+1);
[X,Y] = meshgrid(x,y);
surf(X,Y,uBC')
xlabel('x')
ylabel('y')
title('The solution of the elliptic PDE')
