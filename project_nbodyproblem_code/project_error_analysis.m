N = 8;
d = 3;  
sizeM = [d N];
s1 = 15; s2 = .5; s3 = 4; 
tspan = [0 100]; 
steps = 1000000;
G = 1; 
rng(1234);
x0 = -s1+(s1+s1)*rand(sizeM); 
v0 = (-s2+(s2+s2)*rand(sizeM)); 
m = s3*rand(1,N);
m(1) = 100;
v0(1,1) = 1; v0(2,1) = 1; v0(3,1) = 1; 

%% Reference Solutions
% Warning time heavy computations
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

%% 
s = [10, 100, 500, 1000, 5000, 10000, 50000, 100000, 500000];
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
                SEToNorm(t) = xBEtemp(p,i,t);            
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