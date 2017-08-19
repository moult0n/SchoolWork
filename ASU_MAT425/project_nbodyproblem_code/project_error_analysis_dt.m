function error_analysis_dt()
N = 8;  % Number of bodies
d = 3; % dimensions 
sizeM = [d N];
s1 = 15; s2 = .5; s3 = 4; %initial condition modifiers
tspan = [0 50]; 
steps = 1000000;
G = 1; % 6.667408*10^-8;
rng(1234); %1234 %1897
x0 = -s1+(s1+s1)*rand(sizeM); % initial position seeded random w/ uniform distribution
v0 = (-s2+(s2+s2)*rand(sizeM)); % initial velocity seeded random w/ uniform distribution
m = s3*rand(1,N); % mass seeded random w/ uniform distribution
m(1) = 100; % make mass 1 larger than the other bodies
% x0(1,1) = 0; x0(2,1) = 0; x0(3,1) = 0;
v0(1,1) = 1; v0(2,1) = 1; v0(3,1) = 1; % give mass 1 a larger initial velocity
[xRK4ref,vRK4ref,t_meshRK4ref]=RK4_solver(x0, v0, tspan, G, m, steps); % RK4
[xBEref,vBEref,t_meshBEref]=BE_solver(x0, v0, tspan, G, m, steps); % BE
[xSEref,vSEref,t_meshSEref]=SE_solver(x0, v0, tspan, G, m, steps); % SE
[aR,bR,cR] = size(xRK4ref);
xRK4normRef = zeros(aR, bR);
xSEnormRef = zeros(aR, bR);
xBEnormRef = zeros(aR, bR);

rk4ToNorm = zeros(1,cR);
BEToNorm = zeros(1,cR);
SEToNorm = zeros(1,cR);
for i = 1:bR
    for p = 1:aR
        for t=1:cR
            rk4ToNorm(t) = xRK4ref(p,i,t);
            BEToNorm(t) = xBEref(p,i,t);
            SEToNorm(t) = xBEref(p,i,t);            
        end        
        xRK4normRef(p,i) = norm(rk4ToNorm);
        xBEnormRef(p,i) = norm(BEToNorm);
        xSEnormRef(p,i) = norm(SEToNorm);
    end
end

s = [10, 100, 500, 1000, 5000, 10000, 50000, 100000, 500000, 750000];
errorNormRK4 = length(s);
errorNormBE = length(s);
errorNormSE = length(s);
for k = 1:length(s)
    [xRK4temp,vRK4temp,t_meshRK4temp]=RK4_solver(x0, v0, tspan, G, m, s(k)); % RK4
    [xBEtemp,vBEtemp,t_meshBEtemp]=BE_solver(x0, v0, tspan, G, m, s(k)); % BE
    [xSEtemp,vSEtemp,t_meshSEtemp]=SE_solver(x0, v0, tspan, G, m, s(k)); % SE    
    [a, b, c] = size(xRK4temp);    
    xRK4normTemp = zeros(a, b);
    xSEnormTemp = zeros(a, b);
    xBEnormTemp = zeros(a, b);
    rk4ToNorm = zeros(1,c);
    BEToNorm = zeros(1,c);
    SEToNorm = zeros(1,c);    
    for i = 1:b
        for p = 1:a
            for t=1:c % matlab hasnt implement this for vectors
                rk4ToNorm(t) = xRK4temp(p,i,t);
                BEToNorm(t) = xBEtemp(p,i,t);
                SEToNorm(t) = xSEtemp(p,i,t);            
            end        
            xRK4normTemp(p,i) = norm(rk4ToNorm);
            xBEnormTemp(p,i) = norm(BEToNorm);
            xSEnormTemp(p,i) = norm(SEToNorm);
        end
    end    
    errorNormRK4(k) = norm(xRK4normRef-xRK4normTemp);
    errorNormBE(k) = norm(xBEnormRef-xBEnormTemp);
    errorNormSE(k) = norm(xSEnormRef-xSEnormTemp);
end
%% Convergence with graphs
[cRK4] = convergence_order(s, tspan, errorNormRK4,1);
title('RK4')
hold off
[cBE] = convergence_order(s, tspan, errorNormBE,1);
title('Explicit Euler')
hold off
[cSE] = convergence_order(s, tspan, errorNormSE,1);
title('Symplectic Euler')
hold off

%% Convergence Without Graphs
% [cRK4] = convergence_order(s, tspan, errorNormRK4,0);
% [cBE] = convergence_order(s, tspan, errorNormBE,0);
% [cSE] = convergence_order(s, tspan, errorNormSE,0);

disp(['RK4 convergence ' num2str(cRK4,'%1.5f')])
disp(['BE convergence ' num2str(cBE,'%1.5f')])
disp(['SE convergence ' num2str(cSE,'%1.5f')])

save('semi_random_analysis_data_.mat')
end
function [cR] = convergence_order(N, tspan, errorSol, plot)
dxInt = (tspan(2)-tspan(1))./N;
c = polyfit(log(dxInt),log(errorSol),1);
cR = c(1);
if (plot == 1)
    figure
    loglog(dxInt,errorSol,'-o',...
        dxInt,exp(c(2)+c(1)*log(dxInt)),'-');
    xlabel('dx')
    ylabel('error')
    legend('|y-y_{ref}|','linear regression','location','northwest')
    hold on
end
end
function [x,v,t_mesh]=RK4_solver(x0, v0, tspan, G, m, N)
f = @(t,x,v) nBodyModel(x,v,m,G);
h = (tspan(2)-tspan(1))/N;
t_mesh = tspan(1):h:tspan(2);
x(:,:,1) = x0;
v(:,:,1) = v0;
for k = 2:N+1
    [k1dx, k1dv] = f(t_mesh,x(:,:,k-1),v(:,:,k-1));
    [k2dx, k2dv] = f(t_mesh+h/2,x(:,:,k-1)+k1dx*h/2,v(:,:,k-1)+k1dv*h/2);
    [k3dx, k3dv] = f(t_mesh+h/2,x(:,:,k-1)+k2dx*h/2,v(:,:,k-1)+k2dv*h/2);
    [k4dx, k4dv] = f(t_mesh+h,x(:,:,k-1)+k3dx*h,v(:,:,k-1)+k3dv*h);
    x(:,:,k) = x(:,:,k-1)+h*(1/6)*(k1dx+2*k2dx+2*k3dx+k4dx);
    v(:,:,k) = v(:,:,k-1)+h*(1/6)*(k1dv+2*k2dv+2*k3dv+k4dv);
end
end
function [x,v,t_mesh]=BE_solver(x0, v0, tspan, G, m, N)
f = @(t,x,v) nBodyModel(x,v,m,G);
h = (tspan(2)-tspan(1))/N;
t_mesh = tspan(1):h:tspan(2);
x(:,:,1) = x0;
v(:,:,1) = v0;
for k = 2:N+1
    [dx, dv] = f(t_mesh,x(:,:,k-1),v(:,:,k-1));
    x(:,:,k) = x(:,:,k-1)+h.*dx;
    v(:,:,k) = v(:,:,k-1)+h.*dv;
end
end
function [x,v,t_mesh]=SE_solver(x0, v0, tspan, G, m, N)
f = @(t,x,v) nBodyModel(x,v,m,G);
h = (tspan(2)-tspan(1))/N;
t_mesh = tspan(1):h:tspan(2);
x(:,:,1) = x0;
v(:,:,1) = v0;
for k = 2:N+1
    [dx, dv] = f(t_mesh,x(:,:,k-1),v(:,:,k-1));
    v(:,:,k) = v(:,:,k-1)+h.*dv;
    x(:,:,k) = x(:,:,k-1)+h.*v(:,:,k); %+.5*dv*(h^2);    
end
end
function [dx, dv] = nBodyModel(x,v,m,G)
%%
% x is the position vector of mass i
% v is the velocity vector of mass i
% m is the mass of i
% G is the 'big G' gravitational constant

[mx, nx] = size(x);
[mv, nv] = size(v);
dx = zeros(mx, nx);
dv = zeros(mv, nv);
F = zeros(mx,nx);

N = nx;
for i=1:N
    F = zeros(mx,nx);
    dx(:,i) = v(:,i);
    for j=1:N
        if(j ~= i)
            res = ((norm(x(:,j)-x(:,i)))^3);
            F(:,j) = m(j)*((x(:,j)-x(:,i)))/res;
        end
    end
    f = sum(F');
    dv(:,i) = G*f';
end
end
