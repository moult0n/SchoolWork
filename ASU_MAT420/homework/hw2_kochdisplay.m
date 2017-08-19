function kochdisplay(maxlev,p,t)
figure(1)
set(gcf,'color','white')
pp = plot(p(1,:),p(2,:),'b');
axis equal
hold on
%%plot(.2*t(1,:),.2*t(2,:)+.7,'r');
hold off
axis off%%
%%pause(5)
for lev = 1:maxlev
    q = koch(lev,p,t);
    set(pp,'xdata',q(1,:),'ydata',q(2,:))
    %%pause(2)
end
end

