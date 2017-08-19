disp('cnx<<cny, cyx>>cxy, X favored initially')
figure
p = 10000;
x0 = [5000, 500];
cnx = .03; cny = .1; cyx = .01; cxy = .5;
c = [cnx cny cyx cxy];
displayProjectResult(c, p, x0)
hold off
%%
disp('cnx>>cny, cyx<cxy, X favored initially')
figure
p = 10000;
x0 = [1000, 100];
cnx = .3; cny = .03; cyx = .2; cxy = .4;
c = [cnx cny cyx cxy];
displayProjectResult(c, p, x0)
hold off
%%
disp('cnx>>cny, cyx=cxy, Y favored initially')
figure
p = 10000;
x0 = [2000, 2000];
cnx = .03; cny = .7; cyx = .4; cxy = .2;
c = [cnx cny cyx cxy];
displayProjectResult(c, p, x0)
hold off