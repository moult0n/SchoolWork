function p395()
p0 = .2;
h = 0:.01:1;
c = .05;
mu = .01;
tspan = [0, 300];
dt = .01;
f = @(t,y) model(c,y,h(60),mu);

[z, y, t] = RK4P(f,dt,tspan,p0);
figure
plot(t,y)
title('Solution')

figure
dh = .01;
p1usH = 0:dh:(mu*(1-(2/c)))/(c-2);
p1sH = (mu*(1-(2/c)))/(c-2):dh:1;
p2sH = 0:dh:(mu/c);
p2usH = (mu/c):dh:1;
p1us = p1usH-(mu/c);
p1s = p1sH-(mu/c);
p2s = 0.*p2sH;
p2us = 0.*p2usH;
plot(p1usH,p1us,'b--');
hold on
plot(p2sH,p2s,'r-');
plot(p1sH,p1s,'b-')
plot(p2usH,p2us,'r--')
h = legend('P = h-$\frac{\mu}{c}$','P = 0','Location', 'Northwest');
set(h,'Interpreter','latex')
xlabel('h')
ylabel('P')
title('Bifurcation Diagram')
hold off
grid on
end

function dPdt = model(c,P,h,mu)
dPdt = c.*P.*(h-P)-mu.*P;
end