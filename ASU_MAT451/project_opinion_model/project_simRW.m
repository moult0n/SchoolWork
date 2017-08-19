p = 10000;
x0 = [500, 500];

disp('cnx=cny=cyx=cxy')
figure
cnx = .03; cny = .03; cyx = .03; cxy = .03;
c = [cnx cny cxy cyx];
displayProjectResult(c, p, x0)
hold off
%%
disp('cnx=cny, cyx=cxy')
figure
cnx = .03; cny = .03; cyx = .01; cxy = .01;
c = [cnx cny cxy cyx];
displayProjectResult(c, p, x0)
hold off
%%
disp('cnx>cny, cyx=cxy')
figure
cnx = .05; cny = .03; cyx = .01; cxy = .01;
c = [cnx cny cxy cyx];
displayProjectResult(c, p, x0)
hold off
%%
disp('cnx<cny, cyx=cxy')
figure
cnx = .03; cny = .05; cyx = .01; cxy = .01;
c = [cnx cny cxy cyx];
displayProjectResult(c, p, x0)
hold off
%%
disp('cnx=cny, cyx>cxy')
figure
cnx = .03; cny = .03; cyx = .02; cxy = .01;
c = [cnx cny cxy cyx];
displayProjectResult(c, p, x0)
hold off
%%
disp('cnx=cny, cyx<cxy')
figure
cnx = .03; cny = .03; cyx = .01; cxy = .02;
c = [cnx cny cxy cyx];
displayProjectResult(c, p, x0)
hold off
%%
disp('cnx<<cny, cyx>>cxy, X favored initially')
figure
p = 10000;
x0 = [5000, 500];
cnx = .03; cny = .1; cyx = .5; cxy = .01;
c = [cnx cny cxy cyx];
displayProjectResult(c, p, x0)
hold off