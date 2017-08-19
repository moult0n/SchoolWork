function x = mergesort(x)
n = length(x);
if n>1
    m = fix(n/2);
    x1 = mergesort(x(1:m));
    x2 = mergesort(x(m+1:end));
    x = merge(x1,x2);
end