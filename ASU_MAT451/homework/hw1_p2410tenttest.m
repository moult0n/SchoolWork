N = 1000;
x = linspace(0,1,N);
%% Dealing with mu > 1
u = 2;
y = tentmap(u,x,N);
y2 = tentmap(u,y,N); %order 2 solutions
y3 = tentmap(u,y2,N); %order 3 solutions
%% Plot order 3 solution with cobwebbing
plot(x,y3,x,x)
%% Plot order 1 with cobwebbing
plot(x,y,x,x)
%% Plot order 1
plot(x,y)
%% Plot order 2
plot(x,y2)
%% Plot mu < 1 
u = .5;
y4 = tentmap(u,x,N);
plot(x,y4,x,x)
%% Plot of mu = 1
u = 1;
y5 = tentmap(u,x,N);
plot(x,y5,x,x)

%% ORBITALS 
y0 = 2/9;
for i=1:10
    y1 = u*min(y0(i),(1-y0(i)));
    y0 = [y0 y1];
end
y0