function ex5
x = linspace(0,4,100);
y1=f(x,-1);
y2=f(x,0);
y3=f(x,1);
plot(x,y1,'g--',x,y2,'ko-',x,y3,'b-')
title('Solutions to dy/dx = x + 2');
legend('y(0) = -1','y(0) = 0','y(0) = 1','location','northwest');
end
function y=f(x,C)
y=((x.^2)/2)+2.*x+C;
end
