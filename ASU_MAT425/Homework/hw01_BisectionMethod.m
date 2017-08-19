function [ x,step ] = BisectionMethod( ab,limit,f )
%%
% The function requires bounds to be passed in for ab in the form of [a,b],
% the limit is the accuracy of the equation, and f is an autonomous
% function. Solves for the root and number of steps that it takes to reach.
a = ab(1); b = ab(2); %inital bounds 
step = 0;
x = a+(b-a)/2; % first midpoint value
while (b-a)/2 > limit && x ~= 0
    a = ab(1); b = ab(2); % reaquire bounds
    x = a+(b-a)/2; % refind midpoint
    fa = f(a);fx = f(x); 
    if fa*fx < 0 % change bounds 
        ab = [a,x];
    else
        ab = [x,b];
    end
    step = step+1;    
end
end

