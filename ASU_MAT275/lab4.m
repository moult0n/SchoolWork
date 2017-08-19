%% Lab 4 - Moulton Julien-Lehr - MTuWThF 11:50 AM - 1:10 PM
%
%% Exercise 1
%
%%
% *(a)*
type LAB04ex1.m;
run LAB04ex1.m;
%%
% *(b)*
% y reaches a local maximum at t=0.5289.
%%
% *(c)*
% The long term behavior of y is to oscillate between the values 
% 0.2236 and -0.2234.
%%
% *(d)*
% The long term behavior stays the same dispite the change in initial
% conditions. This is because the value for cosine stays the same between
% the two equations while only the values v and y change. The change of y
% and v gets cancelled out as t gets sufficiently large.
type LAB04ex1d.m;
run LAB04ex1d.m;
%% Exercise 2
%
%%
% *(a)*
type LAB04ex2.m;
run LAB04ex2.m;
%%
% *(b)*
% In the short term L4h is considerably more eradict and takes longer to
% settle to an oscillation between about -.5 and .5. However in L4g the
% graph reaches an oscillation point quicker.
%%
% *(c)*
% L4h the amplitude is 0.5310 while in L4g the amplitude is 0.2236.
%%
% *(d)*
% The solutions are identical, thus the need to use a dashed line for the
% solution to eulers method.
type LAB04ex2d.m;
run LAB04ex2d.m;

%% Exercise 3
%
type LAB04ex3.m;
run LAB04ex3.m;
%%
% The behavior of the solution is different from the solution to L4.7.
% Matlab is giving a warning about not being to integrate at
% t=3.774765e+00. This is because the solution to the initial values is only 
% unique up to t=3.774765e+00.
%% Exercise 4
%
%%
% *(a)*
type LAB04ex4.m;
run LAB04ex4.m;
%%
% *(b)*
% L4i appears to the differentiated L4h.
%%
% *(c)*
%%
% *(d)*