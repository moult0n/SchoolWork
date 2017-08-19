function y = myrowproduct(A,x)
[m,n] = size(A);
[p,q] = size(x);

if(q==1&&p==n)
    y = zeros(m,1);
    for i = 1:n;
        y = y + x(i)*A(:,i);
        
    end
else
    disp('dimensions do not match')
    y=[];
end
end