%% Build phase plots and solutions 

p = 10000;
x0 = [500, 500];

%% Build general graphs for Analysis Visualization
cnx = .03; cny = .03; cyx = .01; cxy = .01; 
c = [cnx cny cxy cyx];
displayPhasePlot(c, p, x0)

cnx = .05; cny = .03; cyx = .01; cxy = .01; 
c = [cnx cny cxy cyx];
displayPhasePlot(c, p, x0)

cnx = .03; cny = .05; cyx = .01; cxy = .01; 
c = [cnx cny cxy cyx];
displayPhasePlot(c, p, x0)

cnx = .03; cny = .03; cyx = .02; cxy = .01; 
c = [cnx cny cxy cyx];
displayPhasePlot(c, p, x0)
 
cnx = .03; cny = .03; cyx = .01; cxy = .02; 
c = [cnx cny cxy cyx];
displayPhasePlot(c, p, x0)
figure(2)
legend('cnx = .03; cny = .03; cyx = .01; cxy = .01;', ...
    'cnx = .05; cny = .03; cyx = .01; cxy = .01;',...
    'cnx = .03; cny = .05; cyx = .01; cxy = .01;',...
    'cnx = .03; cny = .03; cyx = .02; cxy = .01;',...
    'cnx = .03; cny = .03; cyx = .01; cxy = .02;');


p = 10000;
x0 = [25, 25];
cnx = .09; cny = .12; cyx = .11; cxy = .2; 
c = [cnx cny cxy cyx];
displayProjectResult(c,p,x0)

%% Different Solutions and phase plots
%%

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