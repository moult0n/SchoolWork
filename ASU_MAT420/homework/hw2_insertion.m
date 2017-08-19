function x = insertion(x)
n = length(x);
    for i = 2:n
    j = i-1;
    xi = x(i);
    while j>=1 && xi<x(j), j = j-1; end % continue until a smaller coefficient is found
    x = [x(1:j),xi,x(j+1:i-1),x(i+1:end)]; % move xi after x(j) (<=xi)
end