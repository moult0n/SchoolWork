clear
clc

u = @(x, y) x/(x^2+y*2);
n = 20; m = 10;
a = 1; b = 3;
c = 0; d = 1;
bc = [a b c d];
dx = (b-a)/n;
dy = (d-c)/m;

tic
[sol] = elliptic_pde_solver(n, m, bc);
toc

x = linspace(a,b,n+1);
y = linspace(c,d,m+1);
[X,Y] = meshgrid(x,y);
figure(1)
surf(X,Y,sol)
xlabel('x')
ylabel('y')
title('The solution of the elliptic PDE')
view(50,35)

% Error Analysis
N = 10:10:100;

for k = 1:10
    n = N(k);
    m = 10;
    dx = (b-a)/n;
    dy = (d-c)/m;

    [sol] = elliptic_pde_solver(n, m, bc);
    
    refTemp = zeros(n+1,m+1);
    for i = 0:n
        for j = 0:m
            x = a+(i)*dx;
            y = c+(j)*dy;
            refTemp(i+1,j+1) = u(x,y);
        end
    end
    
    error = max(abs(sol-refTemp'));
    errorSol(k) = max(error);
end


figure
dxInt = (b-a)./N;
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
