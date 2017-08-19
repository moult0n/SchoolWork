%%
% *(a)*
f=inline('2*y','t','y');
t=linspace(0,.5,100); 
y=3*exp(2*t); 
[t5,y5]=impeuler(f,[0,.5],3, 5);
[t50,y50]=impeuler(f,[0,.5],3, 50);
[t500,y500]=impeuler(f,[0,.5],3, 500);
[t5000,y5000]=impeuler(f,[0,.5],3, 5000);
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
% Every time the number of steps is multiplied by 10 the ratio stay about
% the same at 100. Therefore every time the step size is divided by 10
% the error is divided by 100. This confirms that improved Euler's method
% is of order h sqaured.