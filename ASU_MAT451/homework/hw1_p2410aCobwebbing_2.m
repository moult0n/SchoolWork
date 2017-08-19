N = 1000;
x = linspace(0,1,N);
u = .5;
y = tentmap(u,x,N);
plot(x,y,x,x)
hold on

P_initial = .7;
x_coords = [P_initial P_initial];
P_second = tentmap(u,x_coords,1);
y_coords = [0 P_second(1)];
plot(x_coords,y_coords,'k-<')

x_coords = [P_initial P_second(1)];
y_coords = [P_second(1) P_second(1)];
plot(x_coords,y_coords,'k-<')

x_coords = [P_second(1) P_second(1)];
P_third = tentmap(u,x_coords,1);
y_coords = [P_second(1) P_third(1)];
plot(x_coords,y_coords,'k-<')

x_coords = [P_second(1) P_third(1)];
y_coords = [P_third(1) P_third(1)];
plot(x_coords,y_coords,'k-<')

x_coords = [P_third(1) P_third(1)];
P_fourth = tentmap(u,x_coords,1);
y_coords = [P_third(1) P_fourth(1)];
plot(x_coords,y_coords,'k-<')

x_coords = [P_third(1) P_fourth(1)];
y_coords = [P_fourth(1) P_fourth(1)];
plot(x_coords,y_coords,'k-<')

x_coords = [P_fourth(1) P_fourth(1)];
P_fifth = tentmap(u,x_coords,1);
y_coords = [P_fourth(1) P_fifth(1)];
plot(x_coords,y_coords,'k-<')

x_coords = [P_fourth(1) P_fifth(1)];
y_coords = [P_fifth(1) P_fifth(1)];
plot(x_coords,y_coords,'k-<')

x_coords = [P_fifth(1) P_fifth(1)];
P_sixth = tentmap(u,x_coords,1);
y_coords = [P_fifth(1) P_sixth(1)];
plot(x_coords,y_coords,'k-<')

x_coords = [P_fifth(1) P_sixth(1)];
y_coords = [P_sixth(1) P_sixth(1)];
plot(x_coords,y_coords,'k-<')

x_coords = [P_sixth(1) P_sixth(1)];
P_seventh = tentmap(u,x_coords,1);
y_coords = [P_sixth(1) P_seventh(1)];
plot(x_coords,y_coords,'k-<')

x_coords = [P_sixth(1) P_seventh(1)];
y_coords = [P_seventh(1) P_seventh(1)];
plot(x_coords,y_coords,'k-<')