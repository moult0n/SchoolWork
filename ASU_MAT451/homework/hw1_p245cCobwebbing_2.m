clear
clc
format short

k = .0001;
M = 5000;
m = 100;
x = [50,100,101,2500,4000,5000,7000];
limit = 10^-8;

an = 0:20:16000;
an1 = model245(an,k,M,m);
plot(an, an1,'b-',an,an,'k-')

hold on

P_initial = 2500;
x_coords = [P_initial P_initial];
P_second = model245(x_coords,k,M,m);
y_coords = [0 P_second(1)];
plot(x_coords,y_coords,'r->')

x_coords = [P_initial P_second(1)];
y_coords = [P_second(1) P_second(1)];
plot(x_coords,y_coords,'r->')

x_coords = [P_second(1) P_second(1)];
P_third = model245(x_coords,k,M,m);
y_coords = [P_second(1) P_third(1)];
plot(x_coords,y_coords,'r->')

x_coords = [P_second(1) P_third(1)];
y_coords = [P_third(1) P_third(1)];
plot(x_coords,y_coords,'r->')

x_coords = [P_third(1) P_third(1)];
P_fourth = model245(x_coords,k,M,m);
y_coords = [P_third(1) P_fourth(1)];
plot(x_coords,y_coords,'r->')

x_coords = [P_third(1) P_fourth(1)];
y_coords = [P_fourth(1) P_fourth(1)];
plot(x_coords,y_coords,'r->')

x_coords = [P_fourth(1) P_fourth(1)];
P_fifth = model245(x_coords,k,M,m);
y_coords = [P_fourth(1) P_fifth(1)];
plot(x_coords,y_coords,'r->')

P_initial = 7000;
x_coords = [P_initial P_initial];
P_second = model245(x_coords,k,M,m);
y_coords = [0 P_second(1)];
plot(x_coords,y_coords,'r-<')

x_coords = [P_initial P_second(1)];
y_coords = [P_second(1) P_second(1)];
plot(x_coords,y_coords,'r-<')

x_coords = [P_second(1) P_second(1)];
P_third = model245(x_coords,k,M,m);
y_coords = [P_second(1) P_third(1)];
plot(x_coords,y_coords,'r-<')

x_coords = [P_second(1) P_third(1)];
y_coords = [P_third(1) P_third(1)];
plot(x_coords,y_coords,'r-<')

x_coords = [P_third(1) P_third(1)];
P_fourth = model245(x_coords,k,M,m);
y_coords = [P_third(1) P_fourth(1)];
plot(x_coords,y_coords,'r-<')

x_coords = [P_third(1) P_fourth(1)];
y_coords = [P_fourth(1) P_fourth(1)];
plot(x_coords,y_coords,'r-<')

x_coords = [P_fourth(1) P_fourth(1)];
P_fifth = model245(x_coords,k,M,m);
y_coords = [P_fourth(1) P_fifth(1)];
plot(x_coords,y_coords,'r-<')

P_initial = 13000;
x_coords = [P_initial P_initial];
P_second = model245(x_coords,k,M,m);
y_coords = [0 P_second(1)];
plot(x_coords,y_coords,'g-<')

x_coords = [P_initial P_second(1)];
y_coords = [P_second(1) P_second(1)];
plot(x_coords,y_coords,'g-<')

x_coords = [P_second(1) P_second(1)];
P_third = model245(x_coords,k,M,m);
y_coords = [P_second(1) P_third(1)];
plot(x_coords,y_coords,'g-<')

x_coords = [P_second(1) P_third(1)];
y_coords = [P_third(1) P_third(1)];
plot(x_coords,y_coords,'g-<')

x_coords = [P_third(1) P_third(1)];
P_fourth = model245(x_coords,k,M,m);
y_coords = [P_third(1) P_fourth(1)];
plot(x_coords,y_coords,'g-<')

x_coords = [P_third(1) P_fourth(1)];
y_coords = [P_fourth(1) P_fourth(1)];
plot(x_coords,y_coords,'g-<')

x_coords = [P_fourth(1) P_fourth(1)];
P_fifth = model245(x_coords,k,M,m);
y_coords = [P_fourth(1) P_fifth(1)];
plot(x_coords,y_coords,'g-<')

hold off
axis([0 16000 0 6000])
legend('a_{n+1}=a_n','y=x','Location','southeast')