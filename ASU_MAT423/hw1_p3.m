format long
f3 = @(x) ((1/x)-(1/(x+1)));
f4 = @(x) (1/(x*(x+1)));
x=int64(10^16);
%%
% The result of the calcution is zero. You can keep the denomenator seperated 
% out in order to have the greatest possible accuracy. The calculation done
% in double precision yields the same result in MatLab as the correct
% answer (10^-48) is very close to 0.
f3(x)
%%
f4(x)