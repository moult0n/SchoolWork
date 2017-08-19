function [ySol, intX] = BVP_FEM_solver(N)
p = @(x) x.^2;
q = @(x) 2;
f = @(x) -4*x.^2;
dx = 1/(N+1);
A = zeros(N,N);
b = zeros(N,1);
intX = linspace(0,1,1e6); 
for i=1:N
    [phi_i,dphi_i] = Basis_Phi(intX,i,N);
    b(i) = trapz(intX,f(intX).*phi_i);
    for j=1:N
        [phi_j,dphi_j] = Basis_Phi(intX,j,N);
        A(i,j) = trapz(intX, (p(intX).*dphi_i.*dphi_j)+(q(intX).*phi_i.*phi_j));
    end
end
c = A\b;
ySol = zeros(1,length(intX));
for i=1:N    
    ySol = ySol + c(i)*Basis_Phi(intX,i,N);
end
hold on 
plot(intX,ySol)
end
