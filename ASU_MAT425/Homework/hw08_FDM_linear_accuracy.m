%%-- measure the accuracy of FDM for a linear BVP

%% Boundary value problem
a     = 0;
b     = 1;
alpha = 0;
beta  = 2;

p = @(x) 0*x;
q = @(x) 4 + 0*x;
r = @(x) -4*x;

%% The reference solution
N = 4000;
[yRef,xRef] = FDM_linear_fct(N,p,q,r,a,b,alpha,beta);

figure 
plot(xRef,yRef)
%% Numerical Parameters
Nint = [10 30 70 200 550 1500];
nb   = length(Nint);
%% Initialization
errorSol = zeros(1,nb);

%%---------------------------------%%
%%-----       Loop error        ---%%
%%---------------------------------%%

for k=1:nb
  %% the solution  
  N = Nint(k);
  [y,x] = FDM_linear_fct(N,p,q,r,a,b,alpha,beta);  
  %% estimation error
  y_inter     = spline(x,y,xRef);
  errorSol(k) = max(abs(y_inter-yRef));
end

%%--- plot
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
