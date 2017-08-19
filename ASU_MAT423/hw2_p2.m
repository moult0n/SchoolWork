format long
a = [1.000*10^(-3) 2.000 3.000; -1.000 3.712 4.623; -2.000 1.072 5.643];
b = [5.001; 7.335; 4.715];
correctX = [1;1;1];
%% with partial pivot
x1 = gaussianPivoted(a,b,3)
%%
RelativeError = (abs(correctX-x1)./abs(x1))*100
%% without partial pivot
x2 = gaussian(a,b,3)
relativeError = (abs(correctX-x2)./abs(x2))*100