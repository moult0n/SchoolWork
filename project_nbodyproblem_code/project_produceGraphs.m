figure
plot3(moRK4(1,:), moRK4(2,:), moRK4(3,:) )
hold on 
plot3(moEE(1,:), omEE(2,:), moEE(3,:) )
hold on
plot3(moSE(1,:), moSE(2,:), moSE(3,:) )
xlabel('X Momentum')
ylabel('Y Momentum')
zlabel('Z Momentum')
grid on
title('Angular Momentum')

[eRK4,kRK4,poRK4]=energyExtra(xRK4ref,vRK4ref,m,G);
[eBE,kBE,poBE]=energyExtra(xBEref,vBEref,m,G);
[eSE,kSE,poSE]=energyExtra(xSEref,vSEref,m,G);
[moRK4, msRK4] = momentum(xRK4ref,vRK4ref,m);
[moSE, msSE] = momentum(xSEref,vSEref,m);
[moBE, msBE] = momentum(xBEref,vBEref,m);