function p394()
N0 = 3000;
H1 = 10;
H2 = .0105;
H3 = 10;
r = .02;
K = 4000;
A = 3000;
tspan = [0, 1000];
dt = .01;

m = @(t,y) model(y,r,K);
m1 = @(t,y) model1(y,r,K,H1);
m2 = @(t,y) model2(y,r,K,H2);
m3 = @(t,y) model3(y,r,K,H3,A);

[solm, ym, tm] = RK4P(m,dt,tspan,N0);
[solm1, ym1, tm1] = RK4P(m1,dt,tspan,N0);
[solm2, ym2, tm2] = RK4P(m2,dt,tspan,N0);
[solm3, ym3, tm3] = RK4P(m3,dt,tspan,N0);

figure
plot(tm,ym,tm1,ym1,tm2,ym2,tm3,ym3)
legend('m','m1','m2','m3','location','southeast');


end

function N1 = model1(N,r,K,H1)
N1 = r*N*(1-(N/K))-H1;
end

function N1 = model2(N,r,K,H2)
N1 = r*N*(1-(N/K))-(H2*N);
end

function N1 = model3(N,r,K,H3,A)
N1 = r*N*(1-(N/K))-(H3*(N/(A+N)));
end

function N1 = model(N,r,K)
N1 = r*N*(1-(N/K));
end