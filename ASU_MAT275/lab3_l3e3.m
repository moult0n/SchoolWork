type impeuler.m
%%
%
f=inline('2*y','t','y');
[t5,y5] = impeuler(f,[0,.5],3,5);
%%
%
[t5,y5]