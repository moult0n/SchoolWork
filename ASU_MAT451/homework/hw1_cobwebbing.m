%%%
%%% Matlab script to perform cobwebbing (OCEAN539B, Spring 2005)
%%%
% Parameters
r = 3.1; % Define the reproduction rate:
P_initial = 0.3; % Specify the initial population
%---------------------------------------------------
% Set up two curves to create a plot for cobwebbing:
P_current = 0:.05:1; % This will be the horizontal axis
P_next = r * P_current .* (1 - P_current); % This will be one curve on the vertical axis
%---------------------------------------------------
figure % This creates a new graphics window
plot(P_current,P_next,'k-') % Make the plot
xlabel('Current generation, P_{i}') % Add some labels
ylabel('Next generation, P_{i+1}')
string_for_title = ['Recurrence relation for r = ',num2str(r)];
title(string_for_title)
% Now add a line with slope = 1
hold on % This means don’t erase the old plot when drawing the new plot
plot([0 1],[0 1],'g-.')
%---------------------------------------------------
% This is how you write the contents of a graphics window to a file (type
% "help print" for additional details:
print -depsc cob0.eps
% If you want a different format, you could comment out the above and use
% one of the below instead:
% print -dpng cob1.png
% print -djpeg100 cob1.jpg
%---------------------------------------------------
% Put in the first cobweb line. This is a line that goes from the point
% P_initial on the bottom of the plot, up to the corresponding point on
% the recurrence relation:
x_coords = [P_initial P_initial];
P_second = r*P_initial * (1 - P_initial);
y_coords = [0 P_second];
plot(x_coords,y_coords,'b--')
% This is how you place text labels on the plot:
text(mean(x_coords) - 0.035,mean(y_coords),'#1')
% Save the current graphics window to a file
print -depsc cob1.eps
%---------------------------------------------------
% Put in the second cobweb line. This is a line that goes horizontally
% from the previous point to the line of slope 1.
x_coords = [P_initial P_second];
y_coords = [P_second P_second];
plot(x_coords,y_coords,'b--')
% Place text label on the plot:
text(mean(x_coords),mean(y_coords) + 0.035,'#2')
% Save the current graphics window to a file
print -depsc cob2.eps
%---------------------------------------------------
% Put in the third cobweb line. This is a line that goes vertically
% from the previous point up to the recurrence relation.
x_coords = [P_second P_second];
P_third = r*P_second * (1 - P_second);
y_coords = [P_second P_third];
plot(x_coords,y_coords,'b--')
% Place text label on the plot and save the current graphics window to a file
text(mean(x_coords) - 0.035,mean(y_coords),'#3')
print -depsc cob3.eps
