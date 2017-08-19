function [x]=createMatrix(xi,k)
%%
% Sets up a matrix for the least-squares solution to sum(ai*e^(x_i)(i)) for
% some k that the user inputs. Returns the matrix 
%
% xi is the x vector
% k is the number of columns for the matrix
[m, n] = size(xi);
x=zeros(m,k);
for i=1:m
    for j=1:k
        x(i,j)=exp(xi(i)*j);
    end
end
end