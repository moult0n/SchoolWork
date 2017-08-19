n=10;
%tic, x1 = guassianEliminationP3(n); toc;
%x1
%%
tic, x2 = guassSeidelProblem3(n); toc;
x2
%%
tic, x3 = jacobiProblem3(n); toc;
x3

function [x, count] = jacobiProblem3(f)
% jacobi solves a Ax=B matrix using Jacobi iteration. The
% code runs until the code is accurate to whatever the passed in limit is.
% x is the inital values for the iteration. Returns the matrix and a count
% of the number of iteration it took to reach the solution. The code stops
% running after 500 iterations if the specified solution accuracy is not
% reached (divergent case).
[A, B] = createMatrix(f);
[n, p] = size(B);
x = zeros(n,1);
limit = 10^(-6)
count = 0;
x_old = 100;
while (abs(x_old-x)) > limit 
    x_old = x;
    for i=1:1:n
        y = 0;
        z = 0;
        for j=1:1:(i-1)
            y = y + A(i,j)*x(j);
        end
        for j=(i+1):1:n
            z = z + A(i,j)*x(j);
        end
        x(i) = ((B(i)-(y)-(z))/A(i,i));
    end
    count = count + 1;
end
x; % remove to view solution
end

function [A, b] = createMatrix( n )
% Creates a matrix of size nxn in acordance with 
% the specification from problem 3
innerMatrixValue = 3;
outerMatrixValue = -1;
oppositeDiagonal = .5;
b=ones(1,n);
%% Create the m matrix
A=eye(n,n);
A = A.*innerMatrixValue; %% sets up inner diagonal
i=1;
j=2;
temp = 2;
flip = 0; %% boolen counter to check if either flipping i and j or adding two to j
while i<=n && j<=n %% sets up outer diagonals
    if flip == 0
        A(i,j) = outerMatrixValue;
        temp = i;
        i = j;
        j = temp;
        flip = 1;
    else
        A(i,j) = outerMatrixValue;
        j = j + 2;
        flip = 0;
    end
end
for i=0:1:(n/2)-2
    A(n-i,1+i) = oppositeDiagonal;
    A(1+i,n-i) = oppositeDiagonal;
end
%% create the b vector
b(1)=2.5;
b(n)=2.5;
for i=1:1:(n/2) %Assumes that n is even
    b(1+i)=1.5;
    b(n-i)=1.5;
end
b(n/2)=1;
b((n/2)+1)=1;
b=b.';
end

function [count] = guassSeidelProblem3(f)
% gaussSeidel solves a Ax=B matrix using the Guass-Seidel iteration. The
% code runs until the code is accurate to whatever the passed in limit is.
% x is the inital values for the iteration. Returns the matrix and a count
% of the number of iteration it took to reach the solution. The code stops
% running after 500 iterations if the specified solution accuracy is not
% reached (divergent case).
[A, B] = createMatrix(f);
[n, p] = size(B);
x = zeros(n,1);
limit = 10^(-6);
count = 0;
x_old = 100;
while (abs(x_old-x)) > limit
    x_old = x;
    for i=1:1:n
        y = 0;
        z = 0;
        for j=1:1:(i-1)
            y = y + A(i,j)*x(j);
        end
        for j=(i+1):1:n
            z = z + A(i,j)*x_old(j);
        end
        x(i) = ((B(i)-(y)-(z))/A(i,i));
    end
    count = count + 1;
end
x; % Remove to view solution to problem
end