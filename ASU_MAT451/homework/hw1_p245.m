clear
clc
format short

k = .0001;
M = 5000;
m = 100;
x = [50,100,101,2500,4000,5000,7000];
limit = 10^-8;
sol = zeros(1,7);

[x1,sol(1)] = fpI(limit, x(1),@(x) model245(x,k,M,m));
[x2,sol(2)] = fpI(limit, x(2),@(x) model245(x,k,M,m));
[x3,sol(3)] = fpI(limit, x(3),@(x) model245(x,k,M,m));
[x4,sol(4)] = fpI(limit, x(4),@(x) model245(x,k,M,m));
[x5,sol(5)] = fpI(limit, x(5),@(x) model245(x,k,M,m));
[x6,sol(6)] = fpI(limit, x(6),@(x) model245(x,k,M,m));
[x7,sol(7)] = fpI(limit, x(7),@(x) model245(x,k,M,m));
sol
%% plot multiple ic focus on M
plot(x1(:,1),x1(:,end),'g*',x2(:,1),x2(:,end),'b',x3(:,1),x3(:,end),'o',x4(:,1),x4(:,end),'y',x5(:,1),x5(:,end),'r',x6(:,1),x6(:,end),'go-',x7(:,1),x7(:,end),'k-')
axis([0 60 0 7000])
legend('IC=50','IC=100','IC=101','IC=2500','IC=4000','IC=5000','IC=7000','Location','southeast');
%% plot multiple ic focus on m
plot(x1(:,1),x1(:,end),'g*-',x2(:,1),x2(:,end),'b-',x3(:,1),x3(:,end),'o-')
axis([0 60 0 150])
legend('IC=50','IC=100','IC=101','Location','southeast')





