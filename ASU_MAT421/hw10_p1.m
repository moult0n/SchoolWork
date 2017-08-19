clear
clc

N = 1000;
epsilon = .01;
time1 = zeros(1,10);
time2 = zeros(1,10);
for i = 1:10
    tic
    layer1(epsilon,N); 
    time1(i) = toc;
end
disp('solvlinsys.m')
average1 = sum(time1)/10

for j = 1:10
    tic
    layer2(epsilon,N);
    time2(j) = toc;
end
disp('tridisolve.m')
average2 = sum(time2)/10
disp('Average')
average1/average2