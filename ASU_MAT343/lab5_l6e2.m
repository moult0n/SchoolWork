x = [1 2 3 4 5 6]';
y = [3.0975 6.2785 9.5469 12.9575 15.9649 18.1576]';
xp = linspace(1,6,1000);%extra points on the x axis for a smoother line
v = vander(x);
c = v\y;
p1 = polyfit(x,y,1);%straight line
plot(x,y, 'ko',xp,polyval(c,xp),'r-',xp,polyval(p1,xp),'g-')



