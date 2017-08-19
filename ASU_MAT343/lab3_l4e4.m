syms x 
p = cos([0:5]'*x)
q = expand(p)
%%
%
subs(p,x,2*pi*rand(1))
%%
%
double(subs(p,x,2*pi*rand(1)))
%%
% The soultion shows that none of the values are zero. Therefore the vector
% are linearly independent.