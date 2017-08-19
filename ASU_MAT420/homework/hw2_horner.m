function p = horner(a,x)
% Horner's rule to evaluate p = a(1)+a(2)*x+...+a(n+1)*xˆn

n = length(a)-1;
p = 0*x+a(n+1); % adding 0*x gives p the same size as input x
for k = n:-1:1
    p = p.*x+a(k); % coefficientwise multiplication requires . if x is array
end