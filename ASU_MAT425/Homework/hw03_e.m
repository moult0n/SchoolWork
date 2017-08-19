function e()

% INITIALIZE VARIABLES
f = @(x) sin(x); % function
a = 0; % interval
b = 1;
N = 10000; %10000
dx = (b-a)/N;
x = a:dx:b;
diff_f2 = zeros(1,N-1);
diff_f21 = zeros(1,N-1);
sol1 = zeros(1,N-1);
sol8 = zeros(1,N-1);
sol11 = zeros(1,N-1);
sol12 = zeros(1,N-1);
x1 = a+dx:dx:b-dx;
x2 = a+2*dx:dx:b;
x3 = a:dx:b-2*dx;
x4 = x1';
x5 = x2';
x6 = x3';

% Timing with accel off
feature accel off
disp('Accel Off')
disp('Original (Autonomous)')
tic
for i=2:N
    diff_f2(i-1) = (f(x(i+1)) - 2*f(x(i)) + f(x(i-1))) / dx^2;
end
toc

disp('Function Call')
tic
for i=2:N
    sol8(i-1) = (func(x(i+1)) - 2*func(x(i)) + func(x(i-1))) / dx^2;
end
toc

disp('No function call')
tic
for i=2:N
    sol1(i-1) = (sin(x(i+1)) - 2*sin(x(i)) + sin(x(i-1))) / dx^2;
end
toc

disp('Vectorized, autonomous and row vectors')
tic
sol4 = (f(x2) - 2*f(x1) + f(x3)) / dx^2;
toc

disp('Vectorized, function call and row vectors')
tic
sol9 = (func(x2) - 2*func(x1) + func(x3)) / dx^2;
toc

disp('Vectorized, no function call and row vectors')
tic
sol5 = (sin(x2) - 2*sin(x1) + sin(x3)) / dx^2;
toc

disp('Vectorized, autonomous and col vectors')
tic
sol6 = (f(x5) - 2*f(x4) + f(x6)) / dx^2;
toc

disp('Vectorized, function call and col vectors')
tic
sol10 = (func(x5) - 2*func(x4) + func(x6)) / dx^2;
toc

disp('Vectorized, no function call and col vectors')
tic
sol7 = (sin(x5) - 2*sin(x4) + sin(x6)) / dx^2;
toc

% Timing with accel on
feature accel on
disp('Accel On')
disp('Original (Autonomous)')
tic
for i=2:N
    diff_f21(i-1) = (f(x(i+1)) - 2*f(x(i)) + f(x(i-1))) / dx^2;
end
toc

disp('Function Call')
tic
for i=2:N
    sol11(i-1) = (func(x(i+1)) - 2*func(x(i)) + func(x(i-1))) / dx^2;
end
toc

disp('No function call')
tic
for i=2:N
    sol12(i-1) = (sin(x(i+1)) - 2*sin(x(i)) + sin(x(i-1))) / dx^2;
end
toc

disp('Vectorized, autonomous and row vectors')
tic
sol13 = (f(x2) - 2*f(x1) + f(x3)) / dx^2;
toc

disp('Vectorized, function call and row vectors')
tic
sol14 = (func(x2) - 2*func(x1) + func(x3)) / dx^2;
toc

disp('Vectorized, no function call and row vectors')
tic
sol15 = (sin(x2) - 2*sin(x1) + sin(x3)) / dx^2;
toc

disp('Vectorized, autonomous and col vectors')
tic
sol16 = (f(x5) - 2*f(x4) + f(x6)) / dx^2;
toc

disp('Vectorized, function call and col vectors')
tic
sol17 = (func(x5) - 2*func(x4) + func(x6)) / dx^2;
toc

disp('Vectorized, no function call and col vectors')
tic
sol18 = (sin(x5) - 2*sin(x4) + sin(x6)) / dx^2;
toc
end

function sol = func(x)
    sol = sin(x);
end