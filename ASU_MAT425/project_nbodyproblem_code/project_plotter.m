function plotter(x,s)
figure
[a,b,c] = size(x);
b1x = zeros(c,1);
b1y = zeros(c,1);
b1z = zeros(c,1);
for i=1:b
    for t=1:c
        b1x(t) = x(1,i,t);
        b1y(t) = x(2,i,t);
        b1z(t) = x(3,i,t);
    end
    if(i==1)
        plot3(b1x,b1y,b1z, 'linewidth',2)
    else
        plot3(b1x,b1y,b1z)
    end
    hold on
end
xlabel('X')
ylabel('Y')
zlabel('Z')    
grid on
if (s ~= 0)
    axis([-s s -s s -s s])
end
end