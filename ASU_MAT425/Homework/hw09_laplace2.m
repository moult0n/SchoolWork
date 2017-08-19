function laplace2(N)
%laplace2(N) solves Laplace's equation u_xx + u_yy = 0 on the unit square
%    with (N+1)x(N+1) gridpoints i = 1,...,N+1 and j = 1,...,N+1
%    In u(i,j), i labels rows y and j labels columns x
%    i = 1 labels y = 1, i = N+1 labels y = 0
%    j = 1 labels x = 0, j = N+1 labels x = 1
%    BCs are Dirichlet with u = 0 on boundary except u(x=1,y) = 1
%    Uses Jacobi iteration
%    Try laplace2(100)

tic
h = 1/N; % dx = dy = h
k = (1:N+1);
x = (k-1)/N;
y = (k-1)/N;
u = zeros(N+1,N+1);
u(k,N+1) = 1; % nonzero BC u(x=1,y) = 1

central = u(2:N,2:N);
north = u(1:N-1,2:N);
south = u(3:N+1,2:N);
east = u(2:N,3:N+1);
west = u(2:N,1:N-1);
residual = (-4*central+north+south+east+west);
normresidual0 = sum(sum(abs(residual)))/(N-1)^2;
normresidual = Inf;
iter = 0;
while normresidual > 10^-5*h^2*normresidual0
    iter = iter + 1;
    central = u(2:N,2:N);
    north = u(1:N-1,2:N);
    south = u(3:N+1,2:N);
    east = u(2:N,3:N+1);
    west = u(2:N,1:N-1);
    residual = (-4*central+north+south+east+west);
    u(2:N,2:N) = u(2:N,2:N)+residual/4;
    normresidual = sum(sum(abs(residual)))/(N-1)^2;
end
iter
toc

figure
surf(x,y,u)
shading flat
xlabel('x','FontSize',16); ylabel('y','FontSize',16); zlabel('u','FontSize',16)

end