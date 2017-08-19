p = 10000;
x0 = [25, 25];
cnx = .09; cny = .12; cyx = .11; cxy = .2; 
c = [cnx cny cxy cyx];
figure
displayProjectResult(c,p,x0)
figure
displayPhasePlot(c, p, x0)