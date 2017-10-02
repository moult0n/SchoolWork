function [cR] = convergence_order(N, tspan, errorSol, plot)
dxInt = (tspan(2)-tspan(1))./N;
c = polyfit(log(dxInt),log(errorSol),1);
cR = c(1);
if (plot == 1)
    figure
    loglog(dxInt,errorSol,'-o',...
        dxInt,exp(c(2)+c(1)*log(dxInt)),'-');
    xlabel('dx')
    ylabel('error')
    legend('|y-y_{ref}|','linear regression','location','northwest')
    hold on
end
end