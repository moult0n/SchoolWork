function [x, iter] = nonlinearNewton(x, eq, var, limit)
%%
% The function nonlinearNewton solves for nxn matrix of nonlinear equations
% using the Symbolic math toolbox. The function returns the results and the
% number of iteration to reach that value. Please note that ere is no end
% condition if the solution diverges, be sure to keep this in mind wehn
% setting up the problem.
%
% var need to symbolic variables
% eq are sumbolic equations
% x is the initial guess of solution
% limit is the accuracy of the solution
digitsOld = digits(100);
J = jacobian(eq, var); %finds jacobian of the inputed equations, will fail if m != n
x_old=(ones(size(x))*1000); %initializes previous x values for checking accuracy
iter=0;
while (abs(x_old-x)) > limit %control statement
    x_old=x; % store old x values
    J_s=double(subs(J,var,x)); %solves for the jacobian at the x values, and stores values as number instad of symbol
    f_s=double(subs(eq,var,x)); %solves for the function at the x values, and stores values as number instad of symbol
    z=(J_s^-1)*(-f_s);
    x=transpose(z)+x_old;
    iter=iter+1;
end
digits(digitsOld);
end