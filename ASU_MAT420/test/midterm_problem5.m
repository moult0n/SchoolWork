function problem5
setGlobals('AAAAAAA');
n=7;
hanoi(n,'A','B','C')
end
%The recursive Tower of Hanoi solver
function hanoi(n, init, temp, fin)
%%
% Recursively solves the tower of hanoi and output the solution as a series
% of commands. 
if n==1
    hcomConv(init, fin);
else
    hanoi(n-1, init, fin, temp);
    hanoi(1, init, temp, fin);
    hanoi(n-1, temp, init, fin); 
end
end
%Interprets commands from hanoi
function hcomConv(init, fin)
%%
% Converts commands from hanoi into a string of characters and outputs them 
%disp([init ' to ' fin]) % used for seeing commands
o = getGlobals;
r = regexprep(o,init,fin,'once');
disp(r)
setGlobals(r);
end
%Used to retreive the string
function r = getGlobals
global s
r = s;
end
%Used to save the string
function setGlobals(string)
global s
s = string;
end