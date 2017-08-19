function bvp2(N)
tic
h = 1/N; % h = dx
x = linspace(0,1,N+1);
y = zeros(N-1,1);
b = [zeros(N-2,1); 1/h^2];

e = ones(N-1,1);
D2 = spdiags([e -2*e e],[-1 0 1],N-1,N-1)/h^2;
D1 = spdiags([-e e],[-1 1],N-1,N-1)/(2*h);

normresidual = Inf;
iter = 0;
while normresidual>10^-6 && iter<20
    F = D2*y - y.^2+1+b;
    J = D2 + 2*D1 + spdiags(exp(y),0,N-1,N-1);
    y = y - J\F;
    iter = iter + 1
    normresidual = norm(F,1)/(N-1)
end
y = [0; y; 2];
toc

% To superimpose multiple plots, uncomment:
hold on
% and comment:
%figure

plot(x,y,'b-','LineWidth',2) % Use in turn 'b-','c-','r-' for 3 plots
xlabel('x','FontSize',24)
ylabel('y','FontSize',24)
xlim([0 1])

end