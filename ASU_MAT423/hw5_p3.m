clear
clc
%% Solve using quadratic
xi = [8 11 15 18 22];
yi = [5 9 10 8 7];
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
x = A\b
%% Check
syms y
format short
y0s = (x(3)*(x0^2))+(x(4)*x0)+x(5)
s1 = x(1)*y+x(2);
s2 = (x(3)*(y^2))+(x(4)*y)+x(5);
s3 = (x(6)*(y^2))+(x(7)*y)+x(8);
s4 = (x(9)*(y^2))+(x(10)*y)+x(11);
c1 = double(subs(s1,xi(1)));
c2 = double(subs(s1,xi(2)));
c3 = double(subs(s2,xi(2)));
c4 = double(subs(s2,xi(3)));
c5 = double(subs(s3,xi(3)));
c6 = double(subs(s3,xi(4)));
c7 = double(subs(s4,xi(4)));
c8 = double(subs(s4,xi(5)));
%% Plot
plot(xi,yi,'o')
hold on
axis([8 22 4 11])
fplot( s1, [8 11], 'Linewidth', 2)
fplot( s2, [11 15], 'Linewidth', 2)
fplot( s3, [15 18], 'Linewidth', 2)
fplot( s4, [18  22], 'Linewidth', 2)
hold off