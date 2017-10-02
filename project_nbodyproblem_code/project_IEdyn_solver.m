function [x, v, t_mesh,i] = IEdyn_solver(x0, v0, tspan, G, m)
f = @(x,v) nBodyModel(x,v,m,G);
eps = .01;
x(:,:,1) = x0;
v(:,:,1) = v0;
t_mesh(1) = tspan(1);
h = 1;
[xE,vE] = E(f, x(:,:,1), v(:,:,1), h); % Euler predition points
[xIE,vIE] = IE(f, x(:,:,1), v(:,:,1), h); % Improved Euler predition points
q = Q_solver(xE, xIE, eps, h);
i = 1;

while q >= 0 && t_mesh(i) <= tspan(2)
    [xE,vE] = E(f, x(:,:,i), v(:,:,i), h); % Euler predition points
    [xIE,vIE] = IE(f, x(:,:,i), v(:,:,i), h); % Improved Euler predition points
    q = Q_solver(xE, xIE, eps, h);
    if q < 1
        h = .2*q*h;
    else
        x(:,:,i+1) = xIE;
        v(:,:,i+1) = vIE;
        t_mesh(i+1) = t_mesh(i)+h;
        h = .8*q*h;
        i = i+1;
    end
end
end

function [xE,vE] = E(f, x0, v0, h) %Euler
[dx, dv] = f(x0, v0);
xE(:,:) = x0+h.*dx;
vE(:,:) = v0+h.*dv;
end

function [xIE,vIE] = IE(f, x0, v0, h)
[xE,vE] = E(f, x0, v0, h);
[xE1, vE1] = f(x0+h*xE, v0+h*vE);
xIE(:,:) = x0 + h.*(.5).*(xE+xE1);
vIE(:,:) = v0 + h.*(.5).*(vE+vE1);
end

function q = Q_solver(xE, xIE, eps, h)
dif = abs(xIE-xE);
a = max(max(dif));
q = (eps*h)/a;
end