function [y,t]=IEdyn(f, dt, y0, tb, eps)
y = y0;
t = tb(1);
yEG = E(f, y(1), t(1), dt);
yIEG = IE(f, y(1), t(1), dt);
q = (eps*dt)/abs(yIEG-yEG);
i = 1;

while q >= 0 && t(i) <= tb(2)
    yEG = E(f, y(i), t(i), dt);
    yIEG = IE(f, y(i), t(i), dt);
    q = (eps*dt)/abs(yIEG-yEG);
    if q < 1
        dt = .2*q*dt;
    else
        y = [y, yIEG];
        t = [t, t(i)+dt];
        dt = .8*q*dt;
        i = i + 1;
    end
end
end

function [y1,t1] = E(f, y, t, dt)
y1 = y+dt.*f(t,y);
t1 = t+dt;
end

function [y2,t1] = IE(f, y, t, dt)
[y1, t1] = E(f, y, t, dt);
y2 = y + dt.*(.5).*(f(t,y)+f(t1,y1));
end