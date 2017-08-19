%%-- measure the accuracy of FDM for a linear BVP

%% Boundary value problem
bc = [0, 0];
tspan = [0, 1];
F  = @(y) cos(y);
DF = @(y) diag(-sin(y));

%% The reference solution
tic
n = 20000;
[yRef,xRef] = FDM_nonlinear_fun(F,DF, bc, tspan,n);

figure 
plot(xRef,yRef)
%% Numerical Parameters
Nint = [10,100,1000,10000];
nb   = length(Nint);
%% Initialization
errorSol = zeros(1,nb);

%%---------------------------------%%
%%-----       Loop error        ---%%
%%---------------------------------%%

for k=1:nb
  %% the solution  
  n = Nint(k);
  [y,x] = FDM_nonlinear_fun(F,DF, bc, tspan,n);  
  %% estimation error
  y_inter     = spline(x,y,xRef);
  errorSol(k) = max(abs(y_inter-yRef));
end
toc
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
