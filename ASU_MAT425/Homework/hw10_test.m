dt = .02;
%dx = .1;
dxV = [1 .1 .01 .001];
%dtV = [.02 .0002 .000002];

b = dxV;
error = dxV.^2*dt;
c = polyfit(log(b),log(error),1);

loglog(b,error,'-o',...
       b,exp(c(2)+c(1)*log(b)),'-');
xlabel('dx')
ylabel('error')
legend('max|y-y_{ref}|','linear regression','location','northwest')

%% estimation order CV
fprintf('---------------------------------------\n')
fprintf(' Order accuracy method   :  %f\n',c(1))
fprintf('---------------------------------------\n')