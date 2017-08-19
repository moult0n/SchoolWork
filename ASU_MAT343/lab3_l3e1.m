%%
%
E1 = eye(4);
E1([1,3],:) =  E1([3,1],:);
E2 = eye(4);
E2(2,2) = 5;
E3 = eye(4);
E3(4,1) = 7;
%%
%
a = floor(10*rand(4,3))
%%
% The E1 elemtary matrix flip the first and thrid values in each column.
E1*a
%%
% The E2 elementary matrix multiplies every value in the second row by
% five.
E2*a
%%
% The E3 elementary matrix adds seven times the first row to the third row.
E3*a
%% 
% In general the elementary matrices do some kind of operation on the
% original matrix. 