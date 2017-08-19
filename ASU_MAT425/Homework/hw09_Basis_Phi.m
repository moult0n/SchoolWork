function [phi,dphi]=Basis_Phi(x, i,N)
%% The piece-wise linear basis function
%%
%% | (x-x_im)/dx if x_im < x <= x_i
%% phi(x) = | (x_ip-x)/dx if x_i < x < x_ip
%% | 0 otherwise
%%
%% | 1/dx if x_im < x <= x_i
%% phi’(x) = | -1/dx if x_i < x < x_ip
%% | 0 otherwise

%% init
dx = 1/(N+1);
x_im = (i-1)*dx;
x_i = i*dx;
x_ip = (i+1)*dx;

%% value
phi = (x-x_im)/dx.*((x-x_im)>0).*((x-x_i)<=0) + (x_ip-x)/dx.*((x-x_i)>0).*((x-x_ip)<0);
dphi = 1/dx.*((x-x_im)>0).*((x-x_i)<=0)-1/dx.*((x-x_i)>0).*((x-x_ip)<0);
end
