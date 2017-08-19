format long
%%
% *(i)*
%%
p=3.141592;
p0=3.14;
AbsoluteError= abs(p-p0) % absolute error
%%
RelativeError=abs((p-p0)/p)*100 % relative error
%%
% *(ii)*
%%
p=1000000;
p0=999996;
AbsoluteError= p-p0 % absolute error
%%
RelativeError=((p-p0)/p)*100 % relative error
%%
% *(iiI)*
%%
p=0.000012;
p0=0.000009;
AbsoluteError= p-p0 % absolute error
%%
RelativeError=((p-p0)/p)*100 % relative error