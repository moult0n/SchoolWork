function LAB04ex4
   t0 = 0; tf = 40; y0 = [-1;0;4];
   [t,Y] = ode45(@f,[t0,tf],y0);
   y = Y(:,1); v = Y(:,2); w = Y(:,3); 
   figure(1);
   plot(t,y,'b-',t,v,'r-',t,w,'m-')
   axis ([0 40 -1.5 1.5]); grid on; legend('y(t)','v(t)=y''(t)','w(t)=y''''(t)');
   ylim([-1.5,1.5]);
   figure(2); plot3(y,v,w,'k-'); grid on; view([-40,60]) 
   xlabel('y(t)'); ylabel('v(t)=y''(t)');zlabel('w=y'''''); 
   axis ([-1 1 -1.5 1.5 -4 4]);  
   end
  %----------------------------------------------------------------------
  function dYdt = f(t,Y)
  y = Y(1); v = Y(2); w =Y(3);
  dYdt = [v; w; -sin(t)-4*w*y^2-8*y*v^2-3*v];
  end