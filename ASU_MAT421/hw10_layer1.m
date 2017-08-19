function layer1(epsilon,N)
h = 1/N; % h = dx
x = linspace(0,1,N+1);
y = zeros(N-1,1);

e = ones(N-1,1);
D2 = spdiags([e -2*e e],[-1 0 1],N-1,N-1)/h^2;
D1 = spdiags([-e e],[-1 1],N-1,N-1)/(2*h);

normresidual = Inf;
iter = 0;
while normresidual>10^-6 && iter<20
    F = epsilon*D2*y + 2*D1*y + exp(y);
    J = epsilon*D2 + 2*D1 + spdiags(exp(y),0,N-1,N-1);
    Jfull = full(J);
    y = y - solvelinsys(Jfull,F); % full matrix solve 
    iter = iter + 1;
    normresidual = norm(F,1)/(N-1);
end
y = [0; y; 0];
end

function x = solvelinsys(A,b) 
%solvelinsys(A,b) solves the linear system A x = b 
%   Based on Moler's Numerical Computing with MATLAB, Chapter 2
%   Uses partial pivoting -- see Section 2.6 of NCM
%   Solves P A x = L U x = c = P b
%   Backsolves U x = y with forward solve L y = c
%   Example1: A = [10 -7 0; -3 2 6; 5 -1 5]; b = [7; 4; 6];
%   Example2: 
%   A = [1 2 0 0 0; 2 5 -1 0 0; 0 -1 5 -2 0; 0 0 -2 2 1; 0 0 0 1 3];
%   b = [1 1 9 -3 3]'

% Triangular factorization 
[L,U,p] = lufactor(A);
% Permutation and forward elimination 
y = forward(L,b(p));
% Back substitution 
x = backsubs(U,y);
end
function x = backsubs(U,x) 
% For upper triangular U, x = backsubs(U,b) solves U x = b 
[n,n] = size(U); 
for k = n:-1:1
    j = k+1:n; 
    x(k) = (x(k) - U(k,j)*x(j))/U(k,k);
end
end
function x = forward(L,x) 
% For lower triangular L, x = forward(L,b) solves L x = b 
[n,n] = size(L); 
for k = 1:n
    j = 1:k-1; 
    x(k) = (x(k) - L(k,j)*x(j))/L(k,k);
end
end
function [L,U,p] = lufactor(A) 
% [L,U,p] = lufactor(A) produces a unit lower triangular matrix L, 
% an upper triangular matrix U, and a permutation vector p, 
% so that L U = A(p,:)
[n,n] = size(A); 
p = (1:n)';
for k = 1:n-1
    % Find largest |element| below diagonal in kth column 
    [r,m] = max(abs(A(k:n,k))); 
    m = m+k-1;
    % Skip elimination if column is zero 
    if (A(m,k) ~= 0)
        % Swap pivot row 
        if (m ~= k)
            A([k m],:) = A([m k],:); 
            p([k m]) = p([m k]);
        end
        % Compute multipliers 
        i = k+1:n; 
        A(i,k) = A(i,k)/A(k,k);
        % Update the remainder of the matrix 
        j = k+1:n; 
        % Almost all the cpu time occurs here:
        A(i,j) = A(i,j) - A(i,k)*A(k,j);
    end
end
permutations = p;
% fprintf('A now contains U and lower triangle of L:\n')
% A
% Separate result:
L = tril(A,-1) + eye(n,n);
U = triu(A);
% LU = L*U;
end