%%-- measure the accuracy of FDM for a linear BVP
tic
n = 20000;
[yRef,xRef] = bvp2(n);
figure 
plot(xRef,yRef)
Nint = [10,100,1000,10000];
nb   = length(Nint);
errorSol = zeros(1,nb);
for k=1:nb    
  n = Nint(k);
  [y,x]  = bvp2(n);
  y_inter     = spline(x,y,xRef);
  errorSol(k) = max(abs(norm(y_inter)-norm(yRef)));
end
toc

figure
dxInt = 1./Nint;
c = polyfit(log(dxInt),log(errorSol),1);

loglog(dxInt,errorSol,'-o',...
       dxInt,exp(c(2)+c(1)*log(dxInt)),'-');
xlabel('dx')
ylabel('error')
legend('|y-y_{ref}|','linear regression','location','northwest')

%% estimation order CV
fprintf('---------------------------------------\n')
fprintf(' Order accuracy method   :  %f\n',c(1))
fprintf('---------------------------------------\n')
