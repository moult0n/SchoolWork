function x = merge(x1,x2)
n1 = length(x1);
n2 = length(x2);
i1 = 0;
i2 = 0;
x = [x1,x2];
while i1<n1 || i2<n2
    if i1<n1 && i2<n2
        if x1(i1+1)<=x2(i2+1)
            x(i1+i2+1) = x1(i1+1);
            i1 = i1+1;
        else
            x(i1+i2+1) = x2(i2+1);
            i2 = i2+1;
        end
        elseif i1<n1
            x(i1+i2+1) = x1(i1+1);
            i1 = i1+1;
        elseif i2<n2
            x(i1+i2+1) = x2(i2+1);
            i2 = i2+1;
    end
end