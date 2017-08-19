%% Solve the elliptic PDE
%% u_xx + u_yy = f in [a,b]x[c,d]
%% u = g at the frontier
%% the functions
f = @(x,y) 4;
g = @(x,y) (x-y)^2;
%% domain [a,b]x[c,d]
a = 0; b = 1;
c = 0; d = 2;
%% numerical parameters
n = 10; dx = (b-a)/n;
m = 20; dy = (d-c)/m;
%%--------------------------------%%
%%----- FDM -----%%
%%--------------------------------%%
lMax = (n-1)*(m-1);
A = zeros(lMax,lMax);
vecB = zeros(lMax,1);
ij_to_l = @(i,j) i + (m-1-j)*(n-1);
for i=1:(n-1)
    for j=1:(m-1)
        %% init
        l = ij_to_l(i,j);
        xi = a+i*dx;
        yj = c+j*dy;
        l_ip = ij_to_l(i+1,j);
        l_im = ij_to_l(i-1,j);
        l_jp = ij_to_l(i,j+1);
        l_jm = ij_to_l(i,j-1);
        %%---- the matrix A: stencil with 5 points
        %% diagonal
        A(l,l) = -(2+2*dx^2/dy^2);
        vecB(l) = dx^2*f(xi,yj);
        %% extra diago: !! Danger border !!
        if (i~=1)
            A(l_im,l) = 1;
        else
            %% x_i-1=a (left)
            vecB(l) = vecB(l) - g(a,yj);
        end
        
    end
end

%%------------------------%%
%%--- Solution ---%%
%%------------------------%%
vecU = ...
%%--reconstruction matrix solution
matU = zeros(n+1,m+1);
for i=0:n
    for j=0:m
        if (i==0 || i==n || j==0 || j==m)
            %% at the border
            xi = a+i*dx;
            yj = c+j*dy;
            ...
        else
            %% inside
            l = ij_to_l(i,j);
            ...
        end
    end
end
%%-- plot
x = linspace(a,b,n+1);
y = linspace(c,d,m+1);
[X,Y] = meshgrid(x,y);
surf(X,Y,matU')
xlabel('x')
ylabel('y')
title('The solution of the elliptic PDE')