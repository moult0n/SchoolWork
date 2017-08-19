function p3916_e()
% Constants
alpha = .8;
beta = .2;
K = .03;
gamma = .3;
delta = 40;
% Meshes, y corresponds with y , x correspends with n
yI = -10; %y axis mesh start point
xI = -10; %x axis mesh start point
yF = 30; %y axis mesh stop point
xF = 30; %x axis mesh stop point
i = 1; %increment amount
[x,y] = meshgrid(xI:i:xF,yI:i:yF);
nq = (alpha-beta-K.*y).*x;
yq = gamma.*x-delta.*y;
nn1 = (xI:i:xF);
yn1 = zeros(1,length(nn1))+((alpha-beta)/(K));
yn2 = (gamma*nn1)/delta;
yn3 = yI:i:yF;
nn3 = (delta*yn3)/gamma;
nn4 = zeros(1,length(nn1));
yn4 = zeros(1,length(nn1));
f = @(t,y) model(alpha, beta, K, gamma, delta, y);
[t, w] = rk4_systems(0, 100, 10000, [1 0],f);
[t1, w1] = rk4_systems(0, 100, 10000, [2 0],f);
[t2, w2] = rk4_systems(0, 100, 10000, [15 0],f);

fpN = (alpha-beta)/K
fpY =  delta*fpN/gamma

figure
plot(t, w(1,:),t, w(2,:))
hold on 
plot(t1, w1(1,:),t1, w1(2,:))
plot(t2, w2(1,:),t2, w2(2,:))
title('Solution')
grid on

figure
plot(t, w(1,:))
hold on 
plot(t1, w1(1,:))
plot(t2, w2(1,:))
title('Solution for population')
grid on

figure
plot(t, w(2,:))
hold on 
plot(t1, w1(2,:))
plot(t2, w2(2,:))
title('Solution for waste')
grid on
end

function sol = model(alpha, beta, K, gamma, delta, y)
sol = [(alpha-beta-K*y(2))*y(1); gamma*y(1)-delta*y(2)];
end