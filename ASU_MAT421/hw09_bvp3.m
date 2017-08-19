function bvp3(N)
%layer(epsilon,N) solves the nonlinear BVP
%       epsilon*y'' + 2*y' + exp(y) = 0, y(0)=0, y(1)=0 
%   using central differences with N dx by Newton iteration.
%   Try: layer(0.1,100)

tic
h = 1/N; % h = dx
x = linspace(0,1,N+1);
y = x(2:end-1)';

e = ones(N-1,1);
D2 = spdiags([e -2*e e],[-1 0 1],N-1,N-1)/h^2;
B = [zeros(N-2,1); 1/h^2];

normresidual = Inf;
iter = 0;
yprev = y*100; 
while normresidual>10^-6 && iter<100
    y = D2\((y.^2 - 1) - B);
    iter = iter + 1;
    normresidual = abs((norm(y,1)-norm(yprev,1)));
    yprev = y;
end
y = [0; y; 1];
toc

% To superimpose multiple plots, uncomment:
hold on
% and comment:
%figure

plot(x,y,'b-','LineWidth',.5) % Use in turn 'b-','c-','r-' for 3 plots
xlabel('x','FontSize',24)
ylabel('y','FontSize',24)
xlim([0 1])
iter
end