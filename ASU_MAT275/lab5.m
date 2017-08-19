%% Lab 5 - Moulton Julien-Lehr - MTuWThF 11:50 AM - 1:10 PM
%
%% Exercise 1
%
%%
% *(a)*
% The blue curve represents y=y(t), you can clearly see this because the
% initial condition for y(0) is .1.
%%
% *(b)*
% From the graph the period of motion is pi. Mathmatically the period is
% 2*pi/omega0 and sense omega is 2 the period is pi.
%%
% *(c)*
% The mass will never come to rest in this equation. It will keep
% oscillating between .1 and -.1. This is because ther is no damping in the
% differential equation.
%%
% *(d)*
% The amplititude of oscillations for y is .1.
%%
% *(e)*
% The maximum velocity obtained by the mass is .2m/s. That veolcity is
% obtained every pi*(2n+1)/4 seconds for every positive integer n. 
%%
% 
% <<l5e1e.png>>
% 
%%
% *(f)*
% The size of mass m and the stiffness k of the speing are inversely
% porpotional to each other, as k is divided by m to find omega. Thus a
% larger k or a smaller m will result in a larger omega value and a smaller
% period. Also a smaller k or larger m will result in a smaller omega value
% and a longer period.
% 
% <<l5e1f1.png>>
% 
% <<l5e1f2.png>>
% 
%% Exercise 2
%
%%
% *(a)*
% There is always about .08 n of energy at all times. The graph confirms
% that energy is conserved. However the system will reach energy equalt to
% .0001 just after 8 hours. Each cycle losses about 2.7710e-06 n of energy
% every cycle which is pretty close to 0.
type l5e2a.m
run l5e2a.m
%%
% *(b)*
% Over the 10 second time period the dE/dt=-1.8153e-05 which is about 0.
%%
% *(c)*
% Over the 10 second period the curve doesn't reach the origin. This is
% because the energy is constant. 
type l5e2c.m
run l5e2c.m
%% Exercise 3
%
%%
% *(a)*
type LAB05ex1a
run LAB05ex1a
%%
% *(b)*
% The maximum velocity obtained is .142 at about .75s.
%%
% 
% <<l5e3b.png>>
% 
%%
% *(c)*
% Increasing c decreases the amout of movement
%%
% 
% <<l5e3c2.png>>
% 
% 
% <<l5e3c4.png>>
% 
% 
% <<l5e3c6.png>>
% 
% 
% <<l5e3c8.png>>
% 
%%
% *(d)*
%% Exercise 4
%
%%
% *(a)*
% Energy is not conserved, after about 5.5 seconds the energy equals 0.
type l5e4a
run l5e4a
%%
% *(b)*
%%
% *(c)*
% The graph goes to 0 as energy is not conserved within the system.
run l5e4c