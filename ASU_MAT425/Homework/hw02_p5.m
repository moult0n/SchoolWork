clear
clc


format long 
f = @(x) exp(x);
fd = @(x,h) (f(x+h)-f(x-h))/(2*h);
%% A
a = zeros(1,3);
a(1) = fd(2,.1);
a(2) = fd(2,.01);
a(3) = fd(2,.001)
%% B
h = [.1 .01 .001];
ueb = zeros(1,3);
for i = 1:3
    ueb(i) = (exp(2+h(i))*(h(i))^2)/6;
end
ueb
ae = zeros(1,3);
for i = 1:3
    ae(i) = abs(exp(2)-a(i));
end
ae
de = zeros(1,3);
for i = 1:3
    de(i) = ueb(i)-ae(i);
end
de