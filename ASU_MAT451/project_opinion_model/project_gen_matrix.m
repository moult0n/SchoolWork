function [u, v, x, y] = gen_matrix(p,b,n,c)
%% Build the matrix of possible solution points
% p is total population
% b is axis points 
% n is the number of steps
% c is the constants for the system

yI = b(1); yF = b(2); xI = b(3); xF = b(4); xi = (xF-xI)/n; yi = (yF-yI)/n;
[x,y] = meshgrid(yI:yi:yF,xI:xi:xF);
xuv = x;
yuv = y;
for i=1:(length(xuv)) % modify x and y values, any impossible pairing is set to 0
    for j=1:(length(yuv))
        l = i+j;
        if (l > length(x)+1)
            xuv(i,j) = 0;
            yuv(j,i) = 0;
        end
    end
end
u = zeros(length(xuv));
v = zeros(length(xuv));
for i=1:(length(xuv)) 
    for j=1:(length(yuv))
        if (xuv(i,j)+yuv(i,j)==0)
            u(i,j) = 0;
            v(i,j) = 0;
        else
            z = (1/(xuv(i,j)+yuv(i,j)));
            u(i,j) = z*(c(1)*xuv(i,j)*(p-xuv(i,j)-yuv(i,j))+xuv(i,j)*yuv(i,j)*(c(3)-c(4)));
            v(i,j) = z*(c(2)*yuv(i,j)*(p-xuv(i,j)-yuv(i,j))+xuv(i,j)*yuv(i,j)*(c(4)-c(3))); 
        end
    end
end
end