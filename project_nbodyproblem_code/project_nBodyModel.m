function [dx, dv] = nBodyModel(x,v,m,G)
%%
% x is the position vector of mass i
% v is the velocity vector of mass i
% m is the mass of i
% G is the 'big G' gravitational constant

[mx, nx] = size(x);
[mv, nv] = size(v);
dx = zeros(mx, nx);
dv = zeros(mv, nv);
F = zeros(mx,nx);

N = nx;
for i=1:N
    F = zeros(mx,nx);
    dx(:,i) = v(:,i);
    for j=1:N
        if(j ~= i)
            res = ((norm(x(:,j)-x(:,i)))^3);
            F(:,j) = m(j)*((x(:,j)-x(:,i)))/res;
        end
    end
    f = sum(F');
    dv(:,i) = G*f';
end
end