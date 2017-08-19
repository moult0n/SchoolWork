%% Driver for the Plots of Semi-Random Planetary Clusters
%% Notes on Matrix Set Up
% x(position in space, body, "time"->page index)
% v(velocity in space, body, "time"->page index)
% each of above matches with a for loop index letter
%   p - position
%   i - body
%   t - page index
clear
clc
%% Initialize Variables
N = 8;  % Number of bodies
d = 3; % dimensions 
sizeM = [d N];
s1 = 15; s2 = .5; s3 = 4; %initial condition modifiers
tspan = [0 100]; 
steps = 100000;
G = 1; % 6.667408*10^-8;
rng(1234); %1234 %1897
x0 = -s1+(s1+s1)*rand(sizeM); % initial position seeded random w/ uniform distribution
v0 = (-s2+(s2+s2)*rand(sizeM)); % initial velocity seeded random w/ uniform distribution
m = s3*rand(1,N); % mass seeded random w/ uniform distribution
m(1) = 100; % make mass 1 larger than the other bodies
% x0(1,1) = 0; x0(2,1) = 0; x0(3,1) = 0;
v0(1,1) = 1; v0(2,1) = 1; v0(3,1) = 1; % give mass 1 a larger initial velocity

%% Solve
[xRK4,vRK4,t_meshRK4] = RK4_solver(x0, v0, tspan, G, m, steps); % RK4
[xBE,vBE,t_meshBE] = BE_solver(x0, v0, tspan, G, m, steps); % Explicit Euler
[xSE,vSE,t_meshSE] = SE_solver(x0, v0, tspan, G, m, steps); % Symplectic Euler

%% Solve for energies of system
[eRK4,kRK4,poRK4]=energyExtra(xRK4,vRK4,m,G);
[eBE,kBE,poBE]=energyExtra(xBE,vBE,m,G);
[eSE,kSE,poSE]=energyExtra(xSE,vSE,m,G);
[moRK4, msRK4] = momentum(xRK4,vRK4,m);
[moSE, msSE] = momentum(xSE,vSE,m);
[moBE, msBE] = momentum(xBE,vBE,m);

% %% Plots
% % Position Graphs
% plotter(xRK4, 200)
% title('RK4')
% hold off
% plotter(xBE, 200)
% title('Explicit Euler')
% hold off
% plotter(xSE, 100)
% title('Symplectic Euler')
% hold off
% 
% % Energy Plots
figure
plot(t_meshRK4ref,eRK4)
hold on
plot(t_meshBEref,eBE)
hold on
plot(t_meshSEref,eSE)
title('Energy vs Time')
xlabel('Time')
ylabel('Energy')
legend('RK4','BE','SE')
% 
% % Kinetic Energy Plots
% figure
% plot(t_meshRK4,kRK4)
% hold on
% plot(t_meshBE,kBE)
% hold on
% plot(t_meshSE,kSE)
% title('Kenetic Energy vs Time')
% xlabel('Time')
% ylabel('Energy')
% legend('RK4','BE','SE')
% 
% % Potential Energy Plots
% figure
% plot(t_meshRK4,poRK4)
% hold on
% plot(t_meshBE,poBE)
% hold on
% plot(t_meshSE,poSE)
% title('Potential Energy vs Time')
% xlabel('Time')
% ylabel('Energy')
% legend('RK4','BE','SE')
% 
% % Normed Momentum Plots
% figure
% plot(t_meshRK4, msRK4)
% title('Norm Momentum of RK4')
% xlabel('Time')
% ylabel('Momentum')
% 
% figure
% plot(t_meshBE, msBE)
% title('Norm Momentum of Explicit Euler')
% xlabel('Time')
% ylabel('Momentum')
% 
% figure
% plot(t_meshSE, msSE)
% title('Norm Momentum of Symplectic Euler')
% xlabel('Time')
% ylabel('Momentum')
% 
% % Momentum Plots
figure
plot3(moRK4(1,:), moRK4(2,:), moRK4(3,:) )
title('Momentum of RK4')
xlabel('Time')
ylabel('Momentum')
% 
% figure
% plot3(t_meshBE, moBE(1,:), t_meshBE, moBE(2,:), t_meshBE, moBE(3,:) )
% title('Momentum of Explicit Euler')
% xlabel('Time')
% ylabel('Momentum')
% 
% figure
% plot3(t_meshSE, moSE(1,:), t_meshSE, moSE(2,:), t_meshSE, moSE(3,:) )
% title('Momentum of Symplectic Euler')
% xlabel('Time')
% ylabel('Momentum')