function [x1,v1] = Euler(x,v,dt)
    x1 = x+dt*v;
    v1 = v+dt*(-4*x.^3+4*x);
end