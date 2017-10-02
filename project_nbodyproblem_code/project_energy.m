function [e,k,po]=energy(x,v,m,G)
[a,b,c] = size(x);
k = zeros(c,1); % kenetic energy
po = zeros(c,1); % potential energy
for t=1:c
    for i=1:b
        tempK(i) = (m(i)*(norm(v(:,i,t)))^2)/(2);
    end
    k(t) = sum(tempK);
end
for t=1:c
    for i=1:b
        tempPoJ = zeros(1,b);
        for j=(i+1):b
             tempPoJ(j) = G*m(i)*m(j)/(norm(x(:,j,t)-x(:,i,t)));
        end
        tempPoI(i) = sum(tempPoJ);
    end
    po(t) = sum(tempPoI);
end
e = k - po;
end