clear
clc
%% Notes
% x(position in space, body, "time"->page index)
% v(velocity in space, body, "time"->page index)
% each of above matches with a for loop index letter
%   p - position
%   i - body
%   t - page index

%% Initialize Variables
N = 8;  % Number of bodies
d = 3; % dimensions 
sizeM = [d N];
s1 = 20; s2 = .01; s3 = 5; %initial condition modifiers
tspan = [0 200]; 
steps = 10000;
G = 1; % 6.667408*10^-8;
rng(1234);
x0 = -s1+(s1+s1)*rand(sizeM); % initial position seeded random w/ uniform distribution
v0 = (-s2+(s2+s2)*rand(sizeM)); % initial velocity seeded random w/ uniform distribution
m = s3*rand(1,N); % mass seeded random w/ uniform distribution
m(1) = 100; % make mass 1 larger than the other bodies
v0(1,1) = 1; v0(2,1) = 1; v0(3,1) = 1; % give mass 1 a larger initial velocity

%% Solve
[xSE,vSE,t_meshSE]=SE_solver(x0, v0, tspan, G, m, steps); % SE
[xSEf,vSEf,t_meshSEf]=SE_forward_solver(x0, v0, tspan, G, m, steps); % SE forward
%% Plot
plotter(xSE, 200)
hold off
plotter(xSEf,200)
hold off

[eSE,kSE,poSE]=energyExtra(xSE,vSE,m,G);
[eSEf,kSEf,poSEf]=energyExtra(xSEf,vSEf,m,G);
figure
plot(t_meshSE,eSE)
hold on
plot(t_meshSEf,eSEf)
title('Energy vs Time')
xlabel('Time')
ylabel('Energy')
legend('SE','SEf')

figure
plot(t_meshSE,kSE)
hold on
plot(t_meshSEf,kSEf)
hold on
title('Kenetic Energy vs Time')
xlabel('Time')
ylabel('Energy')
legend('SE','SEf')

figure
plot(t_meshSE,poSE)
hold on
plot(t_meshSEf,poSEf)
hold on
title('Potential Energy vs Time')
xlabel('Time')
ylabel('Energy')
legend('SE','SEf')






