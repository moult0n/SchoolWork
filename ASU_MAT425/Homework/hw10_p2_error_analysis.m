clear
clc

alpha2 = 1;
l      = 10;
T      = 1;
u0 = @(x) sin(pi*x/l);
uSol = @(x,t) exp(-t*pi^2/l^2)*sin(pi*x/l);
dt = .02;
%dx = .1;
dxV = [10 1 .1 .01 .001];
dtV = [.2 .02 .0002 .00002 .000002 .0000002];


%% Solve for error for changing dx
for k=1:5 %check dxV size
    dx = dxV(k);
    %dt = dtV(k);
    ld = alpha2/dx^2*dt;
    nX    = floor(l/dx+.5);
    nTime = floor(T/dt+.5);
    intX  = linspace(0,l,nX);
    u     = u0(intX);
    for n=1:nTime
        %% new time step
        u_new = u;  
        for i=2:(nX-1)
            u_new(i) = (1-2*ld)*u(i) + ld*(u(i-1)+u(i+1));
        end
        u = u_new;
    end
    sol = uSol(intX,1);
    error1(k) = max(abs(u-sol));
end
for i = 1:5
    error1(i)
end 

figure(2)
b = dxV;
c = polyfit(log(b),log(error1),1);

loglog(b,error1,'-o',...
       b,exp(c(2)+c(1)*log(b)),'-');
xlabel('dx')
ylabel('error')
legend('max|y-y_{ref}|','linear regression','location','northwest')

%% estimation order CV
fprintf('---------------------------------------\n')
fprintf(' Order accuracy method   :  %f\n',c(1))
fprintf('---------------------------------------\n')

%% Solve for error for changing dt
dx = .1;

for k=1:6 %check dxV size
    %dx = dxV(k);
    dt = dtV(k);
    ld = alpha2/dx^2*dt;
    nX    = floor(l/dx+.5);
    nTime = floor(T/dt+.5);
    intX  = linspace(0,l,nX);
    u     = u0(intX);
    for n=1:nTime
        %% new time step
        u_new = u;  
        for i=2:(nX-1)
            u_new(i) = (1-2*ld)*u(i) + ld*(u(i-1)+u(i+1));
        end
        u = u_new;
    end
    sol = uSol(intX,1);
    error2(k) = max(abs(u-sol));
end
for i = 1:6
    error2(i)
end
figure(3)
b = dtV;
c = polyfit(log(b),log(error2),1);

loglog(b,error2,'-o',...
       b,exp(c(2)+c(1)*log(b)),'-');
xlabel('dt')
ylabel('error')
legend('max|y-y_{ref}|','linear regression','location','northwest')

%% estimation order CV
fprintf('---------------------------------------\n')
fprintf(' Order accuracy method   :  %f\n',c(1))
fprintf('---------------------------------------\n')