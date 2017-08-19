function [x, iter] = chord(x, eq, var, limit)
%%
% The chord function solves a matrix of nonlinear equations. The code is
% based upon nonlinearNewton and as such see that function for notes how
% the function works.
J = jacobian(eq, var);
J_s=double(subs(J,var,x));
x_old=(ones(size(x))*1000);
iter=0;
while (abs(x_old-x)) > limit
    x_old=x;
    f_s=double(subs(eq,var,x)); 
    z=(J_s^-1)*(f_s);
    x=x_old-z';
    iter=iter+1;
end
end