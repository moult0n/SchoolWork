function exactSol
setenv('GNUTERM','wxt')
figure(1)
set(gcf,'DefaultAxesFontSize',16)
a=.1;
x = linspace(0,1,101);
phi = (exp(2*a)-1);
uexact = (1+phi*x-exp(2*a*x))/(2*a*phi);
plot(x,uexact,'-b','Linewidth',2)
grid on
xlabel('$x$','interpreter','latex','fontsize',24)
ylabel('$u(x)$','interpreter','latex','fontsize',24)
print -depsc bvp.eps
fid = fopen('bvp_exact.dat','w');
fprintf(fid,'%12.8f %12.8f\n',[x;uexact]); % save x and U in ascii file
fclose(fid);

