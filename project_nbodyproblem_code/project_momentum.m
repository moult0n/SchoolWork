function [mo, ms] = momentum(x,v,m)
[a,b,c] = size(x);
mo = zeros(a,c);
for t=1:c 
    for i=1:b
        mo(:,t) = mo(:,t) + m(i)*v(:,i,t);
    end    
end
ms = zeros(1,c);
for t=1:c 
    for i=1:b
        ms(t) = ms(t) + m(i)*norm(v(:,i,t));
    end    
end
end