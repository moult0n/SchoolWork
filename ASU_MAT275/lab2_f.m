function y = f(x)
if(x==10)
    disp('the function is undefined at x = 10')
elseif x<=3
    y=1+x^2;
elseif x>5
    y=x/(x-10);
else 
    y=exp(x);
end
end

