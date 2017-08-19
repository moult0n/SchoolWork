function [x1,v1] = SympEuler(x,v,dt)
    x1 = x+dt*v;
    v1 = v+dt*(-4*x1.^3+4*x1);
end