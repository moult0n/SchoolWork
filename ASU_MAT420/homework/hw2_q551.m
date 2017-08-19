n=20000;
%%
% *(a)*
x=rand(1,n);
tic, sort(x); toc
%%
tic, insertion(x); toc
%%
tic, mergesort(x); toc
%%
tic, quicksort(x); toc
%%
% *(b)*
x=(n:-1:1);
tic, sort(x); toc
%%
tic, insertion(x); toc
%%
tic, mergesort(x); toc
%%
tic, quicksort(x); toc
%%
% *(c)*
x=([1:2:n,2:2:n]);
tic, sort(x); toc
%%
tic, insertion(x); toc
%%
tic, mergesort(x); toc
%%
tic, quicksort(x); toc
%%
% *(d)*
x=randperm(n);
tic, sort(x); toc
%%
tic, insertion(x); toc
%%
tic, mergesort(x); toc
%%
tic, quicksort(x); toc