function x = quicksort(x)
n = length(x);
if n>1
    m = floor(n/2);
    i1 = 1;
    i2 = 1;
    x1 = [];
    x2 = [];
    xm = x(m);
    for i = 1:n
        if i~=m
            if x(i)<xm
                x1(i1) = x(i);
                i1 = i1+1;
            else
                x2(i2) = x(i);
                i2 = i2+1;
            end
        end
    end
    x1 = quicksort(x1);
    x2 = quicksort(x2);
    x = [x1,xm,x2];
end
