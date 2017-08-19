function epde_fdm_accuracy()
clear
clc
% Elliptic PDE solver, using finite difference method
% Accuracy Script

% Reference
u = @(x, y) x/(x^2+y*2);
a = 1; b = 3;
c = 0; d = 1;
N = [10 20 30 40 50 60 70 80 90 100]; M = [10 20 30 40 50 60 70 80 90 100];
bc = [a b c d];

for k = 1:10
    n = N(k);
    m = M(k);
    dx = (b-a)/n;
    dy = (d-c)/m;
    refTemp = zeros(n+1,m+1);
    for i = 0:n
        for j = 0:m
            x = a+(i)*dx;
            y = c+(j)*dy;
            refTemp(i+1,j+1) = u(x,y);
        end
    end
    refSol = refTemp;
    [sol] = solver(n, m, bc);
    error = max(abs(sol-refSol));
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
end

function [sol] = solver(n, m, bc)
f = @(x,y) 0;
g = @(x,y) x/(x^2+y*2);
ux0 = @(x,y)  1/x;
ux1 = @(x,y)  x/(x^2+1);
u1y = @(x,y)  1/(1+y^2);
u3y = @(x,y)  3/(9+y^2);
a = bc(1); b = bc(2);
c = bc(3); d = bc(4);

dx = (b-a)/n;
dy = (d-c)/m;

lMax = (n-1)*(m-1);
A    = zeros(lMax,lMax);
vecB = zeros(lMax,1);
ij_to_l = @(i,j) i + (m-1-j)*(n-1);
for i=1:(n-1)
  for j=1:(m-1)
    %% init
    l    = ij_to_l(i,j);
    xi   = a+i*dx;
    yj   = c+j*dy;
    l_ip = ij_to_l(i+1,j);
    l_im = ij_to_l(i-1,j);
    l_jp = ij_to_l(i,j+1);
    l_jm = ij_to_l(i,j-1);
    %% the matrix A: stencil with 5 points
    A(l,l)  = -(2+2*dx^2/dy^2);
    vecB(l) = dx^2*f(xi,yj);
    %% extra diago: !! the border !!
    if (i~=1)
      A(l,l_im) = 1;
    else
      %% x_i-1=a (left)
      vecB(l) = vecB(l) - u1y(a,yj);
    end
    if (i~=(n-1))
      A(l,l_ip) = 1;
    else
      %% x_i+1=b (right)
      vecB(l) = vecB(l) - u3y(b,yj);
    end
    if (j~=1)
      A(l,l_jm) = dx^2/dy^2;
    else
      %% y_i-1=c (down)
      vecB(l) = vecB(l) - dx^2/dy^2*ux0(xi,c);
    end
    if (j~=(m-1))
      A(l,l_jp) = dx^2/dy^2;
    else
      %% y_i+1=d (up)
      vecB(l) = vecB(l) - dx^2/dy^2*ux1(xi,d);
    end
  end
end
vecU = A\vecB;
matU = zeros(n+1,m+1);
for i=0:n
  for j=0:m
    if (i==0 || i==n || j==0 || j==m)
      %% at the border
      xi = a+i*dx;
      yj = c+j*dy;
      matU(i+1,j+1) = g(xi,yj);
    else
      %% inside
      l = ij_to_l(i,j);
      matU(i+1,j+1) = vecU(l);
    end
  end
end
sol = matU;
end
