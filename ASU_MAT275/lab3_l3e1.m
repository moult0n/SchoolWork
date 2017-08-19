f=inline('2*y','t','y');
t=linspace(0,.5,100); y=3*exp(2*t); % defines the exact solution of the ODE
[t50,y50]=euler(f,[0,.5],3, 50); % solves the ODE using Euler with 50 steps
%%
% *(a)*
[t5,y5]=euler(f,[0,.5],3, 5);
[t500,y500]=euler(f,[0,.5],3, 500);
[t5000,y5000]=euler(f,[0,.5],3, 5000);
approximation = [y5(end) y50(end) y500(end) y5000(end)]'; % for table approximation column
N = [5 50 500 5000]'; % for table rows
e5 = (y(end) - y5(end));
e50 = (y(end) - y50(end));
e500 = (y(end) - y500(end));
e5000 = (y(end) - y5000(end));
error = [e5, e50, e500, e5000]'; % for table error column
ratio = [0, e5/e50, e50/e500, e500/e5000]';
T = table(N, approximation, error, ratio) % generates a table with the data
%%
% *(b)*
% Every time the number of steps is increased by 10 the ratio stays about
% the same; around 10. This means that every the step size is divided by 10, so is the error.
% This confirms that Euler's method is of "order h".
%%
% *(c)*
% Euler's method underestimates the solution in this solution because e
% grows exponentially. Thus anytime you predict the next point by using the
% tangent line at the current point you will be getting an underestmation
% of the next point.