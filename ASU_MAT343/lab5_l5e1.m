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