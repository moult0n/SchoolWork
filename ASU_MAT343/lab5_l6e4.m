x = 0.1:0.1:1;
y = [3.2641 2.8281 5.0391 3.9653 5.4878 6.3570 4.3012 10.8792 10.0212 11.7558]';
xp = linspace(.1,1,1000);%extra points for a better curve
v = vander(x');
c = v\y;
p2=polyfit(x',y,2);%quadratic function
plot(x,y, 'ko',xp,polyval(c,xp),'r-',xp,polyval(p2,xp),'g-')

