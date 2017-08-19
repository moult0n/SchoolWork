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

