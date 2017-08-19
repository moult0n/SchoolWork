function [t, w] = rk4_systems(a, b, N, alpha)
m = size(alpha,1);
if m == 1
   alpha = alpha';
end

h = (b-a)/N;        %the step size
t(1) = a;
w(:,1) = alpha;     %initial conditions

for i = 1:N
   k1 = h*f(t(i), w(:,i));
   k2 = h*f(t(i)+h/2, w(:,i)+0.5*k1);
   k3 = h*f(t(i)+h/2, w(:,i)+0.5*k2); 
   k4 = h*f(t(i)+h, w(:,i)+k3);
   w(:,i+1) = w(:,i) + (k1 + 2*k2 + 2*k3 + k4)/6;
   t(i+1) = a + i*h;
end
end


function dy = f(t, y)
dy = [y(2); y(1)^3-y(1)*y(2)];
end
