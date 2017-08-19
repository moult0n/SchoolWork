function layer(epsilon,N,color)
%layer(epsilon,N) solves the nonlinear BVP
%       epsilon*y'' + 2*y' + exp(y) = 0, y(0)=0, y(1)=0 
%   using central differences with N dx by Newton iteration.
%   Try: layer(0.1,100)

tic
h = 1/N; % h = dx
x = linspace(0,1,N+1);
y = zeros(N-1,1);

e = ones(N-1,1);
D2 = spdiags([e -2*e e],[-1 0 1],N-1,N-1)/h^2;
D1 = spdiags([-e e],[-1 1],N-1,N-1)/(2*h);

normresidual = Inf;
iter = 0;
while normresidual>10^-6 && iter<20
    F = epsilon*D2*y + 2*D1*y + exp(y);
    J = epsilon*D2 + 2*D1 + spdiags(exp(y),0,N-1,N-1);
    y = y - J\F;
    iter = iter + 1;
    normresidual = norm(F,1)/(N-1);
end
y = [0; y; 0];
toc

% To superimpose multiple plots, uncomment:
hold on
% and comment:
%figure

plot(x,y,color,'LineWidth',2) % Use in turn 'b-','c-','r-' for 3 plots
xlabel('x','FontSize',24)
ylabel('y','FontSize',24)
xlim([0 1])
end