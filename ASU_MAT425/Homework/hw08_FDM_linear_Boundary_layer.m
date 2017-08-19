%% Solve the BVP with the finite difference method
%%   y'' = p(x) y' + q(x) y + r(x)
%%   y(0)= α, y(b)= β

%% Boundary value problem
a     = 0;
b     = 1;
alpha = 0;
beta  = 0;

ep = -1/50;

p = @(x) -1/ep + 0*x;
q = @(x) 0*x;
r = @(x) 1/ep + 0*x;

%% Parameters
N  = 1000-1;
dx = 1/(N+1);
x  = a+dx*(1:N);


%% Initialization
A = -diag(1+dx/2*p(x(2:N)),-1)  + diag(2+dx^2*q(x)) - diag(1-dx/2*p(x(1:(N-1))),1);
vecB = -dx^2*r(x');
%% boundary condition
vecB(1) = vecB(1) + (1+dx/2*p(x(1)))*alpha;
vecB(N) = vecB(N) + (1-dx/2*p(x(N)))*beta;

%%----------------------------%%
%%-----       solve        ---%%
%%----------------------------%%

Y=A\vecB;
%% boundary condition
y_sol = [alpha; Y; beta];


%%----- plot
plot([a x b],y_sol')
xlabel('x')
ylabel('y')
title('ep y'''' + y''=1, y(0)=y(1)=0')
