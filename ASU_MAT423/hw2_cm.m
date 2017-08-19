function [ m ] = cm( n )
% Creates a matrix of size nxn in acordance with 
% the specification from problem 3
innerMatrixValue = 3;
outerMatrixValue = -1;
oppositeDiagonal = .5;
m=eye(n,n);
m = m.*innerMatrixValue;
i=1;
j=2;
temp = 2;
flip = 0; %% boolen counter to check if either flipping i and j or adding two to j
while i<=n && j<=n
    if flip == 0
        m(i,j) = outerMatrixValue;
        temp = i;
        i = j;
        j = temp;
        flip = 1;
    else
        m(i,j) = outerMatrixValue;
        j = j + 2;
        flip = 0;
    end
end
for i=0:1:2
    m(n-i,1+i) = oppositeDiagonal;
    m(1+i,n-i) = oppositeDiagonal;
end
end

