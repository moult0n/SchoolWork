tic
xRef = linspace(0,1,1e6);
yExact = @(x) x.*(x-1);
[yRef] = yExact(xRef);

%% Numerical Parameters
Nint = [5 10 15 20 25 30 35];
nb   = length(Nint);
%% Initialization
errorSol = zeros(1,nb);

%%---------------------------------%%
%%-----       Loop error        ---%%
%%---------------------------------%%

for k=1:nb
    tic
    %% the solution  
    N = Nint(k);
    [y,x] = BVP_FEM_solver(N);  
    %% estimation error
    y_inter     = spline(x,y,xRef);
    errorSol(k) = max(abs(y_inter-yRef));
  toc
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
toc
