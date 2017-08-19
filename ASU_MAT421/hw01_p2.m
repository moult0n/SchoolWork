%% Notes
%
dudt = @(u1,u2,t) (u1-u2)/t;
eq = @(t) sin(t);
t = .1;
exactSol = cos(1)
%%
compSol = dudt(eq(1.1),eq(1),t)
