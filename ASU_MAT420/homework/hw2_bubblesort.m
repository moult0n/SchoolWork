function [ x ] = bubblesort( x )
n=length(x);
while (n>0)
    n1=0;
    for i=2:n
        if (x(i) < x(i-1))
            temp = x(i);
            x(i) = x(i-1);
            x(i-1) = temp;
            n1 = i;           
        end
    end
    n = n1;
end
end

