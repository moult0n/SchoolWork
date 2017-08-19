function LAB04ex1
   t0 = 0; tf = 40; y0 = [-1;0];
   [t,Y] = ode45(@f,[t0,tf],y0);
   y = Y(:,1); v = Y(:,2);
   figure(1);
   plot(t,y,'b-',t,v,'r-')
   axis ([0 40 -1.5 1.5]); grid on; legend('y(t)','v(t)=y''(t)');
   ylim([-1.5,1.5]);
   figure(2)
   plot(y,v,'k-') 
   xlabel('y(t)'); ylabel('v(t)=y''(t)'); axis ([-1 1 -1.5 1.5]);  
   end
  %----------------------------------------------------------------------
  function dYdt = f(t,Y)
  y = Y(1); v = Y(2);
  dYdt = [v; cos(t)-4*v-3*y];
  end