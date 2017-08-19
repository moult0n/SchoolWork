clear 
clc
%% Notes
% All 
%% Problem 1
syms x
t = [0 10 30 40];
p = [3.04 3.71 5.28 6.08];
x0 = 35; 
x1 = 47;
y0 = (t(2)-x)/(t(2)-t(1))*p(1)+(x-t(1))/(t(2)-t(1))*p(2); % Equation 1
y1 = (t(3)-x)/(t(3)-t(2))*p(2)+(x-t(2))/(t(3)-t(2))*p(3); % Equation 2
y2 = (t(4)-x)/(t(4)-t(3))*p(3)+(x-t(3))/(t(4)-t(3))*p(4); % Equation 3
disp('Problem 1 solutions')
y0s = double(subs(y2,x0)) % linear solution to x=35
y1s = double(subs(y2,x1)) % linear solution to x=47
%% Problem 2
syms y
s = [10 25 40 55 70];
fe = [12 26 28 30 24];
x0 = 30; 
x1 = 65;
%% 
% Linear
y0l = (s(2)-y)/(s(2)-s(1))*fe(1)+(y-s(1))/(s(2)-s(1))*fe(2);
y1l = (s(3)-y)/(s(3)-s(2))*fe(2)+(y-s(2))/(s(3)-s(2))*fe(3);
y2l = (s(4)-y)/(s(4)-s(3))*fe(3)+(y-s(3))/(s(4)-s(3))*fe(4);
y3l = (s(5)-y)/(s(5)-s(4))*fe(4)+(y-s(4))/(s(5)-s(4))*fe(5);
disp('Problem 2 linear solutions')
y2s = double(subs(y1l,x0)) % linear solution to x=30
y3s = double(subs(y3l,x1)) % linear solution to x=65
%%
% Quadratic
format rat
eq1 = [25 1 0 0 0 0 0 0 0 0 0]';
eq2 = [0 0 625 25 1 0 0 0 0 0 0]';
eq3 = [0 0 1600 40 1 0 0 0 0 0 0]';
eq4 = [0 0 0 0 0 1600 40 1 0 0 0]';
eq5 = [0 0 0 0 0 3025 55 1 0 0 0]';
eq6 = [0 0 0 0 0 0 0 0 3025 55 1]';
eq7 = [10 1 0 0 0 0 0 0 0 0 0]';
eq8 = [0 0 0 0 0 0 0 0 4900 70 1]';
eq9 = [1 0 -50 -1 0 0 0 0 0 0 0]';
eq10 = [0 0 80 1 0 -80 -1 0 0 0 0]';
eq11 = [0 0 0 0 0 110 1 0 -110 -1 0]';
A = [eq1 eq2 eq3 eq4 eq5 eq6 eq7 eq8 eq9 eq10 eq11]';
b = [26 26 28 28 30 30 12 24 0 0 0]';
format short
x = A\b;
disp('Problem 2 Quadratic solutions')
y4s = (x(3)*(x0^2))+(x(4)*x0)+x(5) % Quadratic solution to x=30
y5s = (x(9)*(x1^2))+(x(10)*x1)+x(11) % Quadratic solution to x=65
%% 
% Check each equation at initial and final data point in equations range
% to verify validity of solution
p2s1 = x(1)*y+x(2); % Equation 1
p2s2 = (x(3)*(y^2))+(x(4)*y)+x(5); % Equation 2
p2s3 = (x(6)*(y^2))+(x(7)*y)+x(8); % Equation 3
p2s4 = (x(9)*(y^2))+(x(10)*y)+x(11); % Equation 4
p2c1 = double(subs(p2s1,10));
p2c2 = double(subs(p2s1,25));
p2c3 = double(subs(p2s2,25));
p2c4 = double(subs(p2s2,40));
p2c5 = double(subs(p2s3,40));
p2c6 = double(subs(p2s3,55));
p2c7 = double(subs(p2s4,55));
p2c8 = double(subs(p2s4,70));
%% Problem 3
%% 
% Solve using quadratic splines
p3xi = [8 11 15 18 22];
p3yi = [5 9 10 8 7];
x0 = 12.7; 
format rat
eq1 = [11 1 0 0 0 0 0 0 0 0 0]';
eq2 = [0 0 121 11 1 0 0 0 0 0 0]';
eq3 = [0 0 225 15 1 0 0 0 0 0 0]';
eq4 = [0 0 0 0 0 225 15 1 0 0 0]';
eq5 = [0 0 0 0 0 324 18 1 0 0 0]';
eq6 = [0 0 0 0 0 0 0 0 324 18 1]';
eq7 = [8 1 0 0 0 0 0 0 0 0 0]';
eq8 = [0 0 0 0 0 0 0 0 484 22 1]';
eq9 = [1 0 -22 -1 0 0 0 0 0 0 0]';
eq10 = [0 0 30 1 0 -30 -1 0 0 0 0]';
eq11 = [0 0 0 0 0 36 1 0 -36 -1 0]';
A = [eq1 eq2 eq3 eq4 eq5 eq6 eq7 eq8 eq9 eq10 eq11]';
b = [9 9 10 10 8 8 5 7 0 0 0]';
x = A\b;
format short
disp('Problem 3 solution')
y6s = (x(3)*(x0^2))+(x(4)*x0)+x(5) % soultion to x=12.7
%% 
% Check each equation at initial and final data point in equations range
% to verify validity of solution
p3s1 = x(1)*y+x(2); % Equation 1
p3s2 = (x(3)*(y^2))+(x(4)*y)+x(5); % Equation 2
p3s3 = (x(6)*(y^2))+(x(7)*y)+x(8); % equation 3
p3s4 = (x(9)*(y^2))+(x(10)*y)+x(11); % Equation 4
p3c1 = double(subs(p3s1,p3xi(1)));
p3c2 = double(subs(p3s1,p3xi(2)));
p3c3 = double(subs(p3s2,p3xi(2)));
p3c4 = double(subs(p3s2,p3xi(3)));
p3c5 = double(subs(p3s3,p3xi(3)));
p3c6 = double(subs(p3s3,p3xi(4)));
p3c7 = double(subs(p3s4,p3xi(4)));
p3c8 = double(subs(p3s4,p3xi(5)));
%% 
% Plot
plot(p3xi,p3yi,'o') % initial data
hold on
axis([8 22 4 11])
title('Problem 3 Interpolating Piecewise Polynomial')
fplot( p3s1, [8 11], 'Linewidth', 2) % equation 1 plot, only on range
fplot( p3s2, [11 15], 'Linewidth', 2) % equation 2 plot, only on range
fplot( p3s3, [15 18], 'Linewidth', 2) % equation 3 plot, only on range
fplot( p3s4, [18 22], 'Linewidth', 2) % equation 4 plot, only on range
hold off
%% Problem 4
p4xi = [-1 1 3];
p4yi = [1 4 14];
x0 = 2;
eq1 = [1 1 1 0 0 0]';
eq2 = [0 0 0 1 1 1]';
eq3 = [1 -1 1 0 0 0]';
eq4 = [0 0 0 9 3 1]';
eq5 = [2 1 0 -2 -1 0]';
eq6 = [-2 1 0 0 0 0]';
A = [eq1 eq2 eq3 eq4 eq5 eq6]';
b = [4 4 1 14 0 .5]';
x = A\b;
disp('Problem 4 solution')
y7s = (x(4)*x0^2)+(x(5)*x0)+(x(6))
%% 
% Check each equation at initial and final data point in equations range
% to verify validity of solution
format short
p4s1 = x(1)*y^2+x(2)*y+x(3); % Equation 1
p4s2 = (x(4)*(y^2))+(x(5)*y)+x(6); % Equation 2
p4c1 = double(subs(p4s1,p4xi(1)));
p4c2 = double(subs(p4s1,p4xi(2)));
p4c3 = double(subs(p4s2,p4xi(2)));
p4c4 = double(subs(p4s2,p4xi(3)));

