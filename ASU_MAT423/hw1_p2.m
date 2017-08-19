format long
f = @(x) x.^3-5*x.^2+6*x+.55;
%%
% *(a)*
x=2.73;
FirstTerm = [x^3; 20.3];
SecondTerm = [5*x^2; 37.2];
ThirdTerm = [6*x; 16.3];
fourthTerm = [0.55; 0.55];
rownames = {'exact'; 'chopped'};
T = table(FirstTerm, SecondTerm, ThirdTerm, fourthTerm, 'RowNames', rownames)
y=f(x);
z=-0.05;
RelativeError = abs((y-z)/y)*100
%%
% *(b)*
f1 = @(x) [(x-5)*x+6]*x+.55;
y=f1(x);
z=0.4;
RelativeError = abs((y-z)/y)*100
%%
% *(c)*
%%
% The relative error for part (b) is smaller than the error for part (a).
% Raising x to a power increses the amount of error with in the equation.