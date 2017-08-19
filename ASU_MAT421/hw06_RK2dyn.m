function RK2dyn(w0,t0,tf)
%RK2dyn(w0,t0,tf) solves dw/dt = f(w) from t0 to tf
%   with the column vector of ICs w(t0) = w0 
%   using second-order Runge-Kutta with a dynamic timestep.
%   The function f(w) is implemented below for 2 first-order ODEs.
%   For (damped) harmonic oscillator: RK2dyn([1; -0.05],0,8*pi)
%   For van der Pol oscillator: RK2dyn([1; 0],0,40)
%   For erf, RK2dyn([0; 0],0,2)
%   TO SEE SINGULARITY FOR y' = y^2, y(0) = 1: RK2dyn([1; 0],0,2)

tic
t = t0;
dt_max = (tf-t0)/10;
dt_min = 16*eps*(tf-t0); 
nmax = 200000; % max number of timesteps
EPSILON_REL = 10^-3; EPSILON_ABS = 10^-6;
p = 0.05; omega2 = 1; % for damped harmonic oscillator

w = w0(:);
wsol = transpose(w);
tsol = t;

% calculate initial dt
norm_solution = norm(w,1);
norm_f = norm(f(w),1);
tbar = (EPSILON_REL*norm_solution+EPSILON_ABS)/ ...    
    (EPSILON_REL*norm_f+EPSILON_ABS);
dt = EPSILON_REL^(1/3)*tbar; % since e_l ~ dt^3
dt = min(dt, dt_max);

n = 0;
while t<tf && n<nmax % timestep loop
    n = n+1;
    r = Inf;
    while r>2
        if 1.1*dt >= tf-t
            dt = tf-t;
        end
        tnew = t+dt;
        w1 = w + dt*f(w+dt*f(w)/2); % RK2
        wmid = w + dt*f(w+dt*f(w)/4)/2; % first dt/2 for 2*RK2
        wnew = wmid + dt*f(wmid+dt*f(wmid)/4)/2; % second dt/2 for 2*RK2
        norm_solution = norm(w,1);
        e_l = (4/3)*norm(wnew-w1,1);
        r = e_l/(EPSILON_REL*norm_solution+EPSILON_ABS);
        dt = min(min(2*dt,dt/r^(1/3)),dt_max);
        if dt < dt_min
            warning('MATLAB:dt_min', ...
                'possible singularity: dt = %e < dt_min at t = %e.\n',dt,t); 
            n = nmax; r = 0; % to exit from while loops
        end
    end
    t = tnew;
    w = wnew;
    tsol(end+1,1) = t;
    wsol(end+1,:) = transpose(w);
end
toc
fprintf('\nNumber of steps = %d\n',n)

figure
%plot(tsol,wsol(:,1),'r-',tsol,0,'g.')
% for damped harmonic oscillator, use:
% plot(tsol,wsol(:,1),'r-', ... %tsol,0,'g.', ... 
%    tsol,exp(-p*tsol).*cos(sqrt((-p^2+omega2))*tsol),'b.')
% legend('RK2','exact','Location','NorthEast')
%
% for erf(t), use:
plot(tsol,wsol(:,1),'r-',tsol,erf(tsol),'b.')
legend('RK2','erf','Location','NorthWest')
xlim([t0 tf])
xlabel('t','FontSize',16)
ylabel('y','FontSize',16)

%figure
%plot(wsol(:,1),wsol(:,2),'b-')
%axis square
%xlabel('y','FontSize',16)
%ylabel('dy/dt','FontSize',16)
%title('attractor','FontSize',16)

    function wprime = f(w)
    %wprime = [w(2); -w(1)]; % harmonic oscillator
    %wprime = [w(2); -omega2*w(1)-2*p*w(2)]; % damped harmonic oscillator
    %wprime = [w(2); -w(1)+(4-w(1)^2)*w(2)]; % van der Pol oscillator
    %wprime = [w(1)^2; 1]; % y' = y^2, y(0) = 1: y(t) = 1/(1-t)
    wprime = [2*exp(-w(2)^2)/sqrt(pi); 1]; % erf(t)
    end

end