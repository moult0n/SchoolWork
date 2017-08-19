format compact
h4 = hilbert(4);
h5 = hilbert(5);
b=[1;0;0;1];
%%
% The condition number for Hilbert 4:
cond(h4)
%%
% The condition number for Hilbert 4:
cond(h5)
%%
x1 = gaussian(h4,b,5);
%%
x2 = h4\b;
%%
RelativeError = (abs(x2-x1)./abs(x1))*100 
%%
% I can conclude that Hilbert matrixes are highly ill conditioned and thus
% any small change in the conditions will result in drastic changes in the
% solution.