%% model 
function sol = opinion_model(x,c,p)
sol = [c(1)*(x(1)/(x(1)+x(2)))*(p-x(1)-x(2))+(c(3)*(x(2)/(x(1)+x(2))))*(x(1))-(c(4)*(x(1)/(x(1)+x(2))))*(x(2));...
    (c(2)*(x(2)/(x(1)+x(2))))*(p-x(2)-x(1))-(c(3)*(x(2)/(x(1)+x(2))))*(x(1))+(c(4)*(x(1)/(x(1)+x(2))))*(x(2))];
end