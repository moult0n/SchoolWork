t=linspace(1,10,91);
y=exp(t./10).*sin(t)./((t.^2)+1);
%%
% *(a)*
plot(t,y,'k-')
title('y(t)=(exp(t./10).*sin(t))./(t.^2+1)');
xlabel('t');
ylabel('y');
%%
% *(b)*
plot(t,y,'ko')
title('y(t)=(exp(t./10).*sin(t))./(t.^2+1)');
xlabel('t');
ylabel('y');
%%
%
plot(t,y,'ko-')
title('y(t)=(exp(t./10).*sin(t))./(t.^2+1)');
xlabel('t');
ylabel('y');
