f = @(k,n) factorial(n)/(factorial(k)*factorial((n-k)));
%%
% *(a)*
n=5;
k=3;
a1=f(k,n);
a2=f(k,(n-1))+f((k-1),(n-1));
isequal(a1, a2)
%%
% *(b)*
b=zeros(1,10);
for i=1:length(b)
    b(i)=f(0,i);
end
b
%%
% *(c)*
f(10,20)
