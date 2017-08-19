clear
clc
%% Solve the elliptic PDE
%%    ∂_t u = α^2 ∂_x^2 u    ,  0<x<l, t>0
%%       u(x,0) = u0(x)      ,  0<x<l, t=0
%%     u(0,t) = u(l,t) = 0   ,     t≥0


%%-- parameters
alpha2 = 1;
l      = 10;
T      = 2;
u0 = @(x) sin(pi*x/l);
uSol = @(x,t) exp(-t*pi^2/l^2)*sin(pi*x/l);

%%-- numerical paramters
dx = .02;
dt = .0001;
ld = alpha2/dx^2*dt;

%% init
nTime = floor(T/dt+.5);
nX    = floor(l/dx+.5);

%% IC
intX  = linspace(0,l,nX);
u     = u0(intX);


%%----------------------------------%%
%%-------      loop         --------%%
%%----------------------------------%%
disp('Part 2')
figure(1)
p = dt;
for n=1:nTime
    %% new time step
    u_new = u;  
    for i=2:(nX-1)
        u_new(i) = (1-2*ld)*u(i) + ld*(u(i-1)+u(i+1));
    end
    %% plot
    p = n*dt;
    if (p == dt || p == 1 || p == 2)
        hold on
        plot(intX,u_new)
        xlabel('x')
        axis([0 l 0 1])
        title('solution at time t= 0, 1, 2')
    end
    %% update
    u = u_new;
end
legend('T=0','T=1','T=2')
hold off

% %% Error analysis
% disp('Part C')
% 
% % Parameters
% t = 1;
% dt = .02;
% dxV = [1 .1 .01 .001 .0001 .00001];
% nTime = floor(T/dt+.5);
% 
% % Solve for Error
% for k=1:6 %check dxV size
%     ld = alpha2/dxV(k)^2*dt;
%     nX = floor(l/dxV(k)+.5);
%     intX = linspace(0,l,nX);
%     u = u0(intX);
%     sol = uSol(intX,t);
%     for n=1:nTime
%         u_new = u;  
%         for i=2:(nX-1)
%             u_new(i) = (1-2*ld)*u(i) + ld*(u(i-1)+u(i+1));
%         end
%         %% update
%         u = u_new;
%     end
%     error(k) = max(abs(u-sol));
% end
% 
% figure(2)
% c = polyfit(log(dxV),log(error),1);
% 
% loglog(dxV,error,'-o',...
%        dxV,exp(c(2)+c(1)*log(dxV)),'-');
% xlabel('dx')
% ylabel('error')
% legend('max|y-y_{ref}|','linear regression','location','northwest')
% 
% %% estimation order CV
% fprintf('---------------------------------------\n')
% fprintf(' Order accuracy method   :  %f\n',c(1))
% fprintf('---------------------------------------\n')
% 
% figure(3)
% dxC = [1 .1 .01];
% hold on
% nX = floor(l/dxC(2)+.5);
% intX = linspace(0,l,nX);
% sol = uSol(intX,t);
% plot(intX,sol,'Linewidth',2,'Color', 'k')
% for k=1:3 %check dxV size
%     nX = floor(l/dxC(k)+.5);
%     intX = linspace(0,l,nX);
%     u = u0(intX);
%     sol = uSol(intX,t);
%     u = (1-2*ld)*u + ld*([u(2:end) 0] + [0 u(1:(end-1))]);
%     plot(intX, u)
% end
% legend('dx=1','dx=.1','dx=.01')


