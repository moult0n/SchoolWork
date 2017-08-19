xi=.1:.1:1;
y=[2.43,2.78,3.21,3.77,4.49,5.44, 6.70, 8.38, 10.66, 13.73];
k=[2,3,4,5];
%x=zeros(10,4);
figure(1);
colors='rgby';
plot(xi,y,'c*');hold on;
xg=.1:.001:1; %x inputs for graph
yg=zeros(1,901);
for i=1:2
   o=zeros(5);
   A=createMatrix(xi',k(i));
   A_n=A'*A; %normalized A
   b_n=A'*y'; %normalized b
   x=A_n\b_n
   for j=1:k(i)
       o(j)=x(j);
   end
   yg=solveMatrix(yg,o,xg);
   plot(xg,yg,'-','Color',colors(i));hold on;
end
hold off

