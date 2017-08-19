x=round(10*rand(1,10));
bubblesort(x)
%%
y=rand(1,20000);
tic, bubblesort(y); toc
%%
type bubblesort.m;