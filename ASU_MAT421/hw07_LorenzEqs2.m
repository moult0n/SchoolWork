function LorenzEqs2(delta,tf)
%LorenzEqs2(delta,tf) solves the Lorenz equations 
%   with y(t0)=1 vs. y(t0)=1+delta with x(t0)=0=z(t0) 
%   from t0=0 to tf using fourth/fifth-order Runge-Kutta
%   w(t) = [x(t), y(t), z(t)] & the Lorenz equations are
%   dw/dt = F(w)
%   Try: LorenzEqs2(0.001,40)

tspan = [0 tf];
w0 = [0; 1; 0];
opts = odeset('RelTol',10^-12,'AbsTol',10^-15);
[t1,w1] = ode45(@F,tspan,w0,opts);
[t2,w2] = ode45(@F,tspan,w0+[0; delta; 0],opts);

figure
plot(t1,w1(:,2),'r-',t2,w2(:,2),'b-','LineWidth',2)
xlabel('t','FontSize',24)
ylabel('y','FontSize',24)
xlim([0 tf])

    

end

function wprime = F(t,w)
    wprime = [10*(w(2)-w(1))
         28*w(1)-w(2)-w(1)*w(3)
         w(1)*w(2)-8*w(3)/3];
end