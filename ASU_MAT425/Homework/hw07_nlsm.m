function [t1,w1] = nlsm(tspan, tol, bc,n)
a = tspan(1);
b = tspan(2);
condition = true;
s(1) = 0; s(2) = 1;
alpha = bc(1);
beta = bc(2);
[t, w] = rk4_systems(a, b, n, [alpha, s(1)]);
[t1, w1] = rk4_systems(a, b, n, [alpha, s(2)]);
i = 2;
while condition ~= false || i >= 20
   if abs(w1(1,end)-beta) < tol
        condition = false;
   else
        w1(1,end);
        w(1,end);
        s(i+1) = s(i)-((w1(1,end)-beta)/(w1(1,end)-w(1,end)))*(s(i)-s(i-1));
        w = w1;
        t = t1;
        [t1, w1] = rk4_systems(a, b, n, [alpha, s(i+1)]);
        i = i+1;
   end
end

end