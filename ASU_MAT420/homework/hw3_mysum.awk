#!/usr/bin/awk -f
BEGIN{
"macheps.awk" | getline; eps=$1;
x[1] = 2; x[2] = eps; x[3] = eps;
N = length(x);
s = 0; 
for (n=1;n<=N;n++) { s += x[n] } # standard
print s-2 # should be 2*eps
s = 0; 
for (n=N;n>=1;n--) { s += x[n] } # add small #s first 
print s-2 # is 2*eps!
c = 0; s = 0;
for (n=1;n<=N;n++) { y = x[n]-c; t = s+y; c = (t-s)-y; s = t } # Kahan alg
print s-2 # is 2*eps!
}
