function y = tentmap(u,x,N)
for i=1:N
    if x(i) < 0.5 
        y(i)=u*x(i); 
    elseif x(i) >= 0.5
        y(i)=u*(1-x(i)); 
    end
end
end