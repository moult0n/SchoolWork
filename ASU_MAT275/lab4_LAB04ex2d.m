function LAB04ex2d
   t0 = 0; tf = 40; y0 = [-1;0];
   [t,Y] = ode45(@f,[t0,tf],y0);
   [te,Ye] = euler(@f,[0,40],y0,400); %eulers
   y = Y(:,1); v = Y(:,2);
   ye = Y(:,1); ve = Y(:,2); %eulers outputs
   plot(t,y,'k-',t,ye,'r--','LineWidth',2)
   end
  %----------------------------------------------------------------------
  function dYdt = f(t,Y)
  y = Y(1); v = Y(2);
  dYdt = [v; cos(t)-4*v*y^2-3*y];
  end