syms y
s = [10 25 40 55 70];
fe = [12 26 28 30 24];
x0 = 30; % second equation
x1 = 65; % 4th eq
%% Linear
y0l = (s(2)-y)/(s(2)-s(1))*fe(1)+(y-s(1))/(s(2)-s(1))*fe(2)
y1l = (s(3)-y)/(s(3)-s(2))*fe(2)+(y-s(2))/(s(3)-s(2))*fe(3)
y2l = (s(4)-y)/(s(4)-s(3))*fe(3)+(y-s(3))/(s(4)-s(3))*fe(4)
y3l = (s(5)-y)/(s(5)-s(4))*fe(4)+(y-s(4))/(s(5)-s(4))*fe(5)
y0s = double(subs(y1l,x0));
y1s = double(subs(y3l,x1));
%% Quadratic
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
y2s = (x(3)*(x0^2))+(x(4)*x0)+x(5);
y3s = (x(9)*(x1^2))+(x(10)*x1)+x(11);
%% Check
s1 = x(1)*y+x(2);
s2 = (x(3)*(y^2))+(x(4)*y)+x(5);
s3 = (x(6)*(y^2))+(x(7)*y)+x(8);
s4 = (x(9)*(y^2))+(x(10)*y)+x(11);
c1 = double(subs(s1,10));
c2 = double(subs(s1,25));
c3 = double(subs(s2,25));
c4 = double(subs(s2,40));
c5 = double(subs(s3,40));
c6 = double(subs(s3,55));
c7 = double(subs(s4,55));
c8 = double(subs(s4,70));
