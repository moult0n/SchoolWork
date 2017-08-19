function laplaceNBC(N)
tic
h = 1/N; % dx = dy = h
k = (1:N+1);
x = (k-1)/N;
y = (k-1)/N;
u = zeros(N+1,N+2);
%u(k,N+1) = 1; % nonzero BC u(x=1,y) = 1



% calculate optimal omega for SOR 
mu = cos(pi/(N+1)); % Jacobi spectral radius 
omega = 2*(1-sqrt(1-mu^2))/mu^2

sum = 0;
for i = 2:N
    for j = 2:N
        residual = (-4*u(i,j)+u(i+1,j)+u(i-1,j)+u(i,j+1)+u(i,j-1));
        sum = sum+abs(residual);  
    end
end
normresidual0 = sum/(N-1)^2;
normresidual = Inf;
iter = 0;
while normresidual > 10^-15%*h^2*normresidual0
    iter = iter + 1;
    sum = 0;
    for i = 2:N
        u(i,N+2) = u(i,N)-2*h;
        for j = 2:N+1
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
surf(x,y,u(1:N+1,1:N+1))
shading flat
xlabel('x','FontSize',16); ylabel('y','FontSize',16); zlabel('u','FontSize',16)

end