a = [5 -3; 3 -5];
b = [5 -3; 3 5];
format short
%%
% *(a)*
eig(a)
%%
%
eig(b)
%% 
% A and B do not have the same type of eigenvalues.
%%
%
p=poly(a);
q=poly(b);
x=-8:0.1:8;
y=polyval(p,x);
z=zeros(size(x));
w=polyval(q,x);
plot(x,y,x,w,x,z)
legend('det(A-\lambda I)', 'det(b-\lambda I)', '\lambda-axis')
%%
% You can use the graph to estimate the eigenvalues of A by seeing where
% they equal zero. The graph shows us that the eigenvalues of B have no
% real roots as B never crosses the lambda axis.
%%
% *(b)*
[X D] = eig(a);
%%
% *(i)*
D
%%
% The values are the same.
%%
% *(ii)*
x1=X(:,1)
%%
%
x2=X(:,2)
%%
%
a*x1-D(1,1)*x1
%%
%
a*x2-D(2,2)*x2
%%
% These calculations show the accuracy of the eigenvalues and eigenvectors
% of A.
%%
% *(iii)*
%%
% 
X*D*inv(X)
%%
% *(iv)*
%%
% 
X*(D^5)*inv(X)
%%
% 
X*(D^10)*inv(X)
%%
%
a^5
%%
%
a^10
