function diffusion2(N,tf)
%diffusion2(N,tf) solves the diffusion (heat) equation u_t = u_xx 
%    with N+1 gridpoints 1,...,N+1 from time t0=0 to tf
%    with Dirichlet BCs u(-1,t)=0=u(1,t) and ICs u(x,0)=1-x^2 
%    Uses TRBDF2 method with dynamic timestep
%    Try: diffusion2(100,0.5)

tic
t0 = 0;
dt_max = (tf-t0)/10;
dt_min = 16*eps*(tf-t0); 
nmax = 100000; % max number of timesteps

% Note there are N-1 interior points
GAMMA = 2-sqrt(2);
k = (-3*GAMMA^2+4*GAMMA-2)/(12*(2-GAMMA));
EPSILON_REL = 10^-6; EPSILON_ABS = 10^-12;
u = zeros(N-1,1); % set u to be an N-1 dimensional column vector
umid = zeros(N-1,1);
unew = zeros(N-1,1);
x = zeros(N-1,1);
h = 2/N;
% dt = h^2/2; % forward Euler stability limit
dt = N*h^2/2; % this could be smaller, say = sqrt(N)*h^2/2
e = ones(N-1,1);
D2 = spdiags([e -2*e e],[-1 0 1],N-1,N-1);
j = (1:N-1)';
x = -1+h*j;
u = sin(2*pi*x);

CONST = GAMMA/(2*h^2);
CONST1 = (1-GAMMA)/((2-GAMMA)*h^2);
CONST2 = 1/(GAMMA*(2-GAMMA));
CONST3 = (1-GAMMA)^2/(GAMMA*(2-GAMMA));
C = 2*k/h^2;

t = t0;
n = 0;
while t<tf && n<nmax % timestep loop
    n = n+1;
    r = Inf;
    while r>2
        if 1.1*dt >= tf-t
            dt = tf-t;
        end
        tnew = t+dt;
        umid = (speye(N-1)-CONST*dt*D2)\((speye(N-1)+CONST*dt*D2)*u); % TR
        unew = (speye(N-1)-CONST1*dt*D2)\(CONST2*umid-CONST3*u); % BDF2
        norm_solution = norm(u,1)/(N-1);
        e_l = norm(C*dt*D2*(u/GAMMA-umid/(GAMMA*(1-GAMMA))...
            +unew/(1-GAMMA)),1)/(N-1);
        r = e_l/(EPSILON_REL*norm_solution + EPSILON_ABS);
        dt = min(min(2*dt,dt/r^(1/3)),dt_max);
        if dt <= dt_min
            warning('MATLAB:dtmin','dt = %e < dt_min at t = %e.\n',dt,t);
            n = nmax; r = 0; % to exit from while loops
        end 
    end
    t = tnew;
    u = unew;
    plot([-1; x; 1],[0; u; 0],'b-')
    xlabel('x','FontSize',16)
    ylabel('u','FontSize',16)
    axis([-1 1 -1.1 1.1]);
    M(n) = getframe;
end
toc
movie(M,1,5)
end