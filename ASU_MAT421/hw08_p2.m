f = @(t,y) y^2-y^3;
delta = .00001;
%%ode45(f, [0 1.2/delta], delta)
%%
ode23tb(f, [0 1.2/delta], delta)