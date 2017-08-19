%% Notes
%
eq = @(x) sin(x);
first = (eq(1.1)-eq(.9))/(2*.1)
%%
exactSol = cos(1)
%%
second = (eq(1.1)-2*eq(1)+eq(.9))/(.1^2)
%%
exactSol = -sin(1)