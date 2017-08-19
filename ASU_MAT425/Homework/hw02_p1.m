clear
clc
format long

f = @(x) x*exp(x)-1;
fd = @(x) exp(x)*(x+1);
fdd = @(x) exp(x)*(x+2);

limit = 10^(-16);
%% Bisection Method
a=.5;b=.6;
[x1,step1,fa,fb,fm] = BisectionM( a,b,limit,f );
x1
step1
BError = zeros(1,length(fm));% initialize discrete mapping
for i = 1:length(BError)
    BError(i) = abs(x1-fm(i));
end
tb = 1:1:length(BError); % discrete time mapping
fyb = .5.^(tb)*(b-a); % continuous time model
figure
plot(tb, BError,'o-',tb,fyb, '-')
title('Bisection Method Error')
bt = zeros(2,6);
bt(1,1) = BError(1);  bt(2,1) = fyb(1);
bt(1,2) = BError(11); bt(2,2) = fyb(11);
bt(1,3) = BError(21); bt(2,3) = fyb(21);
bt(1,4) = BError(31); bt(2,4) = fyb(31);
bt(1,5) = BError(41); bt(2,5) = fyb(41);
bt(1,6) = BError(51); bt(2,6) = fyb(51);
bt
%% Newtons Method
x = .6;
[x2,step2,sol] = NewtonsMethod(limit,x,f,fd);
x2
step2
NError = zeros(1,length(sol)); % initialize discrete mapping
for j = 1:length(NError)
    NError(j) = abs(x2-sol(j));
end
tn = 1:1:length(NError); % Discrete time mapping
dtmN = tn;% initialize discrete time model newtons
dtmN(1) = NError(1);
for k = 2:length(NError)
    dtmN(k) = dtmN(k-1)^2*(fdd(sol(k-1)))/(2*fd(sol(k-1)));
end
figure
plot(tn, NError,'o-', tn, dtmN,'-*')
title('Newtons Method Error')

nt = zeros(2,6);
nt(1,1) = NError(1);  nt(2,1) = dtmN(1);
nt(1,2) = NError(2); nt(2,2) = dtmN(2);
nt(1,3) = NError(3); nt(2,3) = dtmN(3);
nt(1,4) = NError(4); nt(2,4) = dtmN(4);
nt(1,5) = NError(5); nt(2,5) = dtmN(5);
nt(1,6) = NError(6); nt(2,6) = dtmN(6);
nt


