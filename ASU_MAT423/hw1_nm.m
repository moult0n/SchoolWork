x = 1.7;
x_old = 100;
x_true = 1.83929;
iter = 0;
while abs(x_old-x) > 10^-5 && x ~= 0
    x_old = x;
    x = ((x^4+1)*(x^4-2*x^3+1))/((x*(x*(((x-4)*x+2)*x^2+2)-4)+6)*x^2+1)+x;
    iter = iter + 1;
    fprintf('Iteration %d: x=%.20f, err=%.20f\n', iter, x, x_true-x);
    pause;
end