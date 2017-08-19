function [x] = fSolve(A,B)
% fSolve solves for x in a Ax=B system, where A is in
% lower triagular form
[n,k]=size(B);
x = zeros(n,k); 
x(1,:)=B(1,:)/A(1,1);
for i=2:1:n
    x(i,:) = (B(i,:) - A(i,i+1:n)*x(i+1:n,:))/A(i,i);
end
end