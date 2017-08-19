function r = romberg(f,a,b,epsilon)
%romberg(f,a,b,epsilon) integrates the function f from a to b
%   Inputs: "anonymous" function f, integration interval [a,b], and 
%   convergence criterion epsilon
%   Example: First define (vectorized) f: 
%      f = @(x) exp(-x).*cos(x)
%   and then integrate:
%      romberg(f,0,2*pi,10^-6)
%   Integral = 0.499066278634146 to 15 digits

max_rows = 32;
step = 1;
r(1,1) = (b-a)*(f(a)+f(b))/2; % initial TR estimate
change = 1;
while change>epsilon && step<max_rows
    step = step+1;
    N = 2^(step-1);
    h = (b-a)/N;
    x = a;
    sum = 0;
    for i = 1:N
        sum = sum + (f(x)+f(x+h))/2; % TR estimates
        x = x+h;
    end
    r(step,1) = h*sum;
    % Richardson extrapolation
    for n = 2:step
        r(step-n+1,n) = (4^(n-1)*r(step-n+2,n-1)-r(step-n+1,n-1))/ ...
	    (4^(n-1)-1);
    end
    change = abs(r(1,step)-r(2,step-1));
end

fprintf('\nstep = %d\nintegral = %19.15g\n',step,r(1,step))
fprintf('integral may be accurate only to one part in %g\n',epsilon)
ezplot(f,[a,b])

end
