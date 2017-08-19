N = 1000;
x = linspace(0,1,N);
u = 1;
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

P_initial = .6;
x_coords = [P_initial P_initial];
P_second = tentmap(u,x_coords,1);
y_coords = [0 P_second(1)];
plot(x_coords,y_coords,'g-<')

x_coords = [P_initial P_second(1)];
y_coords = [P_second(1) P_second(1)];
plot(x_coords,y_coords,'g-<')
