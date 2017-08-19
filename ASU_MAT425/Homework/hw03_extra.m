%%-----------------------------------------------%%
%% Estimation f’’ using midpoint (Matlab/Octave) %%
%%-----------------------------------------------%%
%% Parameters (Input)
f = @(x) sin(x); % function
a = 0; % interval
b = 1;
N = 10000; % nb of subinterval
%% initialization
dx = (b-a)/N;
x = a:dx:b;
diff_f2 = zeros(1,N-1);
%%--- Loop ---%%
%%------------%%
tic
diff_f2 = (sin(x(3:N+1)) - 2*sin(x(2:N)) + sin(x(1:N-1))) / dx^2; %Dont use autonomous calls if efficiency is an issue
toc
%%------------%%
%%------------%%
%% plot (Output)
plot(x,-sin(x),x(2:N),diff_f2)
xlabel('x')
legend('f''','midpoint')
