a=[0,1./(1:1000).^2];
x=[-1,-.5,.5,1];
format long
horner(a,x)
%%
 horner_recursive(a,x,length(a),(0*x+(a(length(a)))))