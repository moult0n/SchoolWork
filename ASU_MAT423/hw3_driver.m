%%
% Sets up the problem that can be solved with Newton's or chord method.
% To solve more equations, make sure they are expressed in the form
% F#(variables)=equation=0. Make sure new variables are declared in the syms line
% Make sure to add any new equations to eq and add new variables to var.
% The methods will output the solution to the system and the number of
% iteration to reach the desire accuracy. The Newton's method will only
% be able to find a solution if the number of equations equals the number
% of variables
syms x y %declare new variables here
limit = 10^(-6); %Accuracy of solution
%%Equations
F1=x^2+y^2-1; 
F2=((x-2)^2/4)+((y-2)^2/9)-1;
eq=[F1;F2]; %make sure to add new equations here
var=[x,y];
%%
% Newton
x_i = [.1,1]; %initial conditions
disp('Newtons Method')
[solution, iter] = nonlinearNewton(x_i, eq, var, limit)
%%
% Chord
disp('Chord Method')
[solution, iter] = chord(x_i, eq, var, limit)
%%
% Time Analysis
disp('Newtons Method run time')
tic, [solution, iter] = chord(x_i, eq, var, limit); toc;
%%
disp('Chord run time')
tic, [solution, iter] = nonlinearNewton(x_i, eq, var, limit); toc;
%%
% Problem 4 code
% creates the matrix that corresponds to each k value, the solves for the a
% coeffiecents, and then plots the corresponding equation. In order for the 
% solveMatrix function to work a full matrix of 5 values needs to be passed
% in. Any a coeffiencent passed in that is greater than the k value needs
% to 0. Chnaging the for-loop to a specific value will allow you see the
% specific coeffiecents for the corresponding k value along with the graph
% for that equation.
xi=.1:.1:1; %initial x data from problem
y=[2.43,2.78,3.21,3.77,4.49,5.44, 6.70, 8.38, 10.66, 13.73]; %initial y data from problem
k=[2,3,4,5];
figure(1);
colors='rgby';
plot(xi,y,'c*');hold on; %plots data points
xg=.1:.001:1; %x inputs for graph
yg=zeros(1,901); %initialized y values for graphing
for i=1:4 
   o=zeros(5); %do not change, this is passed in to solver
   A=createMatrix(xi',k(i));
   A_n=A'*A; %normalized A
   b_n=A'*y'; %normalized b
   x=A_n\b_n % a coeffiecents
   for j=1:k(i) %do not change, will break solution code
       o(j)=x(j);
   end
   yg=solveMatrix(yg,o,xg);
   plot(xg,yg,'-','Color',colors(i));hold on;
end
hold off