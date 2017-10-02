% body_index = [sun, mercury, venus, earth, mars, jupiter, saturn, uranus, neptune]
%% Constants
AU = 1.496E8; %km per au
HOURS = 24; % hours per day
MINS = 60; % mins per hour
GC = 6.6740831*10^-11; % km per kg*s^2
KM = 1000; % meters per kilometer
G = GC*(MINS^2)*(MINS^2)*(HOURS^2)/(KM^3)/(AU^3);
%% Initialize system
mp = (10^24)*[.3302, 4.8685, 5.97219, .64185, 1898.13, 568.319, 86.8103, 102.41];
ms = 1.988544*10^30;
M = [ms, mp]; % in kg
tspan = [0 365.25*190]; % days starts at april 28th 2017 at 00:00
% x0 is in AU originally, change the multiplier in front to change units
x0 = [3.008872951451083E-03, -2.685657256912098E-01, -3.741957397044414E-01, -7.939364135165805E-01, 2.384858614264659E-01, -5.137158975234727E+00, -1.256223512828453E+00, 1.815391504740836E+01, 2.845370456179500E+01;...
    4.711336383373592E-03, -3.622172973414010E-01, -6.140000320902600E-01, -6.105028082452071E-01, 1.534542260888902E+00, -1.818561811501253E+00, -9.969296869918868E+00, 8.229889007943303E+00, -9.339050483273722E+00; ...
    -1.479897809254815E-04, -5.215950138796501E-03, 1.313226205586175E-02, -1.162046116837121E-04, 2.613136769904111E-02, 1.224409656901256E-01, 2.233354375110731E-01, -2.046210894998470E-01, -4.634240512642219E-01];
% v0 is in AU per day, change the multiplier in front to change units
v0 = [-3.864022917406179E-06, 1.691652417271876E-02, 1.712526120365684E-02, 1.023585397255416E-02, -1.330459782452444E-02, 2.430519978509811E-03, 5.229632896840242E-03, -1.652702059087851E-03, 9.584281805628581E-04;...
    6.420913802523291E-06, -1.541203453989143E-02, -1.061451965572268E-02, -1.368075011092574E-02, 3.325606246099946E-03, -6.756619813411429E-03, -7.157113386772168E-04, 3.398846730536222E-03, 3.001616453513089E-03; ...
    8.700670039750091E-08, -2.812092889035933E-03, -1.134052348180080E-03, 6.300317225676941E-07, 3.960673795438496E-04, -2.632663025756375E-05, -1.955093798993776E-04, 3.409699056051559E-05, -8.382948899423441E-05];

steps = tspan(2); % at per hour
[xRK4,vRK4,t_meshRK4] = RK4_solver(x0, v0, tspan, G, M, steps); % RK4
% [xBE,vBE,t_meshBE] = BE_solver(x0, v0, tspan, G, M, steps); % Explicit Euler
% [xSE,vSE,t_meshSE] = SE_solver(x0, v0, tspan, G, M, steps); % Symplectic Euler

plotter(xRK4, 0)
title('RK4')
legend('1','2','3','4','5','6','7','8','9')
hold off
% plotter(xBE, 0)
% title('Explicit Euler')
% hold off
% plotter(xSE, 0)
% title('Symplectic Euler')
% hold off