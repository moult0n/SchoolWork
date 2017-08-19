function solar_system_analysis()
AU = 1.496E8; 
HOURS = 24; 
MINS = 60; 
GC = 6.6740831*10^-11; 
KM = 1000; 
G = GC*(MINS^2)*(MINS^2)*(HOURS^2)/(KM^3)/(AU^3);
mp = (10^24)*[.3302, 4.8685, 5.97219, .64185, 1898.13, 568.319, 86.8103, 102.41];
ms = 1.988544*10^30;
m = [ms, mp]; 
tspan = [0 30]; 
x0 = [3.008872951451083E-03, -2.685657256912098E-01, -3.741957397044414E-01, -7.939364135165805E-01, 2.384858614264659E-01, -5.137158975234727E+00, -1.256223512828453E+00, 1.815391504740836E+01, 2.845370456179500E+01;...
    4.711336383373592E-03, -3.622172973414010E-01, -6.140000320902600E-01, -6.105028082452071E-01, 1.534542260888902E+00, -1.818561811501253E+00, -9.969296869918868E+00, 8.229889007943303E+00, -9.339050483273722E+00; ...
    -1.479897809254815E-04, -5.215950138796501E-03, 1.313226205586175E-02, -1.162046116837121E-04, 2.613136769904111E-02, 1.224409656901256E-01, 2.233354375110731E-01, -2.046210894998470E-01, -4.634240512642219E-01];
v0 = [-3.864022917406179E-06, 1.691652417271876E-02, 1.712526120365684E-02, 1.023585397255416E-02, -1.330459782452444E-02, 2.430519978509811E-03, 5.229632896840242E-03, -1.652702059087851E-03, 9.584281805628581E-04;...
    6.420913802523291E-06, -1.541203453989143E-02, -1.061451965572268E-02, -1.368075011092574E-02, 3.325606246099946E-03, -6.756619813411429E-03, -7.157113386772168E-04, 3.398846730536222E-03, 3.001616453513089E-03; ...
    8.700670039750091E-08, -2.812092889035933E-03, -1.134052348180080E-03, 6.300317225676941E-07, 3.960673795438496E-04, -2.632663025756375E-05, -1.955093798993776E-04, 3.409699056051559E-05, -8.382948899423441E-05];
steps = 500000;
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

s = [1, 10, 50, 100, 500, 1000, 5000, 10000, 50000, 75000, 100000];
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

save('solar_system_analysis_data_.mat')
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