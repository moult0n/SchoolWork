function [x,step,fa,fb,fm] = BisectionM( a,b,limit,f )
%%
% INPUT
% a is the lower bound
% b is the upper bound
% limit is the accuracy of the approximation
% f is the function, needs to be an autonomous function
%
% OUTPUT
% x is the solution
% step is the number of iterations
% fa, fb, fm are the output bounds of each step

step = 0;
fa = a;
fb = b;
x = a+((b-a)/2);
fm = NaN;
while (b-a)/2 > limit 
    fm = [fm, a+((b-a)/2)];
    step = step + 1;
    if f(a)*f(fm(step + 1)) < 0
        fa = [fa, a]; fb = [fb, fm(step +1)];
        b = fm(step +1);
    else
        fa = [fa, fm(step +1)]; fb = [fb, b];
        a = fm(step +1);
    end
    x = fm(step+1);
end
end