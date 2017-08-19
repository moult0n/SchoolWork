function laplace3(N,M)
%laplace3(N) solves Laplace's equation u_xx + u_yy = 0 on the unit square
%    with (N+1)x(N+1) gridpoints i = 1,...,N+1 and j = 1,...,N+1
%    In u(i,j), i labels rows y and j labels columns x
%    i = 1 labels y = 1, i = N+1 labels y = 0
%    j = 1 labels x = 0, j = N+1 labels x = 1
%    BCs are Dirichlet with u = 0 on boundary except u(x=1,y) = 1
%    Uses SOR iteration
%    Try laplace3(100)

tic
a = 1; b = 3;
c = 0; d = 1;
h = 1/N; % dx = dy = h
g = @(x,y) x./(x.^2+y.*2);
k = (1:N+1);
l = (1:M+1);
x = 1+2*(k-1)/N;
y = (l-1)/M;
u = zeros(N+1,M+1);

u(1,l) = g(a,y);
u(N+1,l) = g(b,y);
u(k,M+1) = g(x,c); % nonzero BC u(x=1,y) = 1
u(k,1) = g(x,d);

% calculate optimal omega for SOR 
mu = cos(pi/(N+1)); % Jacobi spectral radius 
omega = 2*(1-sqrt(1-mu^2))/mu^2

sum = 0;
for i = 2:N
    for j = 2:M
        residual = (-4*u(i,j)+u(i+1,j)+u(i-1,j)+u(i,j+1)+u(i,j-1));
        sum = sum+abs(residual);  
    end
end
normresidual0 = sum/(N-1)^2;
normresidual = Inf;
iter = 0;
while normresidual > 10^-5*h^2*normresidual0
    iter = iter + 1;
    sum = 0;
    for i = 2:N
        for j = 2:M
            residual = (-4*u(i,j)+u(i+1,j)+u(i-1,j)+u(i,j+1)+u(i,j-1));
            sum = sum+abs(residual);
            u(i,j) = u(i,j)+omega*residual/4;   
        end
    end
    normresidual = sum/(N-1)^2;
end
iter
toc

figure
surf(y,x,u)
shading flat
xlabel('x','FontSize',16); ylabel('y','FontSize',16); zlabel('u','FontSize',16)

end