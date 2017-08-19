%% Lab 1 - Moulton Julien-Lehr - MTuWThF 11:50 AM - 1:10 PM
%
%% Exercise 1
%
theta = [0,.25*pi,.5*pi,.75*pi,pi,1.25*pi];
r=2;
x=r*cos(theta)
%%
%
y=r*sin(theta)
%%
%
r1=sqrt((x.*x)+(y.*y))
%% Exercise 2
%
t=linspace(1,10,91);
y=exp(t./10).*sin(t)./((t.^2)+1);
%%
% *(a)*
plot(t,y,'k-')
title('y(t)=(exp(t./10).*sin(t))./(t.^2+1)');
xlabel('t');
ylabel('y');
%%
% *(b)*
plot(t,y,'ko')
title('y(t)=(exp(t./10).*sin(t))./(t.^2+1)');
xlabel('t');
ylabel('y');
%%
%
plot(t,y,'ko-')
title('y(t)=(exp(t./10).*sin(t))./(t.^2+1)');
xlabel('t');
ylabel('y');

%% Exercise 3
%
t=linspace(0,20,1000);
x=sin(t);
y=cos(t);
z=t;
plot3(x,y,z,'k-')
%% Exercise 4
%
x=linspace(0,pi,1000);
y=cos(x);
z=1-.5*(x.^2)+(1/24)*(x.^4);
plot(x,y,'r-',x,z,'b--')
grid on;
legend ('y(x)','z(x)');
%% Exercise 5
%
type ex5.m
%%
%
run ex5.m
%% Exercise 6
%
%%
% *(a)*
f = @(x,y) (x^3+(y*exp(x)/(x+1)));
f(2,-1)
%%
% *(b)*
clear f
f(2,-1)
%%
%
type f.m