%% MAT 343 MATLAB Assignment 3 - Moulton Julien-Lehr TWTH 6:10
%
%% Lab 7 Exercise 1
%
%%
% *(a)*
%%
% From the initial figure position we can tell that one of the eigenvector will be
% (1,0). This is because both the vectors x and Ax are aligned at zero
% degrees. since the first eigenvector is (cos(theta), sin(theta)) we get
% (cos(0), sin(0)) or (1,0). The eigenvalue would thus be 5/4.
%%
% *(b)*
%%
% We can conclude that the second eigenvector is at 180 degrees or pi. thus
% the eigenvector will be (0,1) because the second eigenvector will is
% (-sin(theta), cos(theta)). The eigenvalue will be 3/4 for the second
% eigenvector.
%%
% *(c)*
%%
% The eigenvectors for the second matrix would be [(1, 0);(0, -1)] and the
% eigenvalues would be 5/4 and 3/4.
%%
% By inspection we can determine the eigenvalue-eigenvectors of 2x2
% diagonal matrices easily. This is 
% also true for 3x3 matrices. This is because the eigenvalues are
% determined by taking the determinant of the matrix minus the eigenvalues
% identity matrix. Since the determinant of a matrix with only values on
% the diagonal is just those values multiplied by each other you have that
% each value from the matrix is equal to one of the eigenvalues. 
%%
% You can also find the eigenvalue-eigenvector of a diagonal matrix by
% multiplying the matrix by each of the standard bases for that matrix.
% Thus to find the first eigenvalue you would mulitiply the matrix by E1.
% This would then mean that the first value of the matrix would be the
% eigenvalue and the first standard bases is eigenvector.
%% Lab 7 Exercise 2
%
%%
% *(a)*
%%
% A will have one positive eigenvalue.
%%
% *(b)*
%%
% A will have 1 negative eigenvalue.
%%
% *(c)* 
%%
% The positive eigenvalue will is about 5/4 and the negative eigenvalue is
% about -1/2.
%% Lab 7 Exercise 3
%
%%
% *(a)*
%%
% There are no lines that pass through the origin that contain both Ax and
% x.
%%
% *(b)*
%%
% A wont have any real eigenvectors and eigenvalues as there are no lines
% that pass through the origin that contain both Ax and x.
%% Lab 7 Exercise 4
%
format long
A = ones(10)+eye(10);
%%
% *(a)*
%%
% The rank of A-I is one because A-I is just a ten by ten matrix of ones
% thus there will be 9 free variables resulting in a rank of 1.
%%
rank(A-eye(10))
%%
% *(b)*
%%
% The nullity of A-I will be 9. This tells us that there are infinitely
% many solutions to the matrix and 
%%
% *(c)*
%%
% You know that the last eigenvalue must be 11 because based on the rank
% there are nine free variables each with a value of 1. Since the trace of
% A equalled 20 the last eigenvalue will equal 11.
%%
%
trace(A)
%%
% *(d)*
%%
% The eigenvalues are calculated out to 15 digits
e = eig(A)
%%
%
det(A)
%%
% *(e)*
%%
% The product of the eigenvalues is the determinant of A.
%%
%
prod(e)
%%
%
det(A)
%%
% *(f)*
p = poly(A);
%%
%
r = roots(p)
%%
% The computed results are acurate to the tens digit.Using the eig function
% is far more accurate than find the roots of the characteristic
% polynomial.
%% Lab 7 Exercise 5
%
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
%% Lab 7 Exercise 6
%
B = [-1 -1; 1 1];
A = [zeros(2) eye(2); eye(2) B];
%%
% *(a)*
rref(A-eye(4))
%%
%
rref(A+eye(4))
%%
% The dimensions for the eigenspaces are 4x3.
%%
% *(b)*
null(B, 'rat')
%%
% *(c)*
trace(A)
%%
%
det(A)
%%
% A is not defective. The trace and determinant show that A is linearly
% independent but the eigenvalues are linearly dependent.
%%
% *(d)*
format long
c = eig(A)
format short
%%
% The computed values are accurate to 8 digits.
%%
%
[X D] = eig(A);
cond(X)
%%
%
log10(cond(X))
%%
% *(e)*
rank(X)
%%
% No the computed eigenvalues are not independent.
%%
% 
inv(X)*A*X
%%
% The computed matrix X does diagonalize A.
%% Lab Curve Fitting Exercise 1
%
%% Lab Curve Fitting Exercise 2
%
type l6e2.m
run l6e2.m
%% Lab Curve Fitting Exercise 3
%
%%
% A scientist may prefer to work with the linear fir over the 5th degree
% polynomial because of the number of data point is very small. This mean
% that the 5th degree polynimial will become less accurate outside of the
% data points. Also the scientist may know that the relationship they are 
% modeling is a linear function and that using a 5th degree polynomial will
% model the noise from their data points more than the relationship between
% the data.
%% Lab Curve Fitting Exercise 4
%
type l6e4.m
run l6e4.m
%%
% In conclusion you can observe that dispite the ninth degree polynomial
% going through every data point, the quadratic function fits the data
% better.