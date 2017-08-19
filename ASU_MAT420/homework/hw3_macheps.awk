#!/usr/bin/gawk -f
BEGIN {
eps = 1
while (1+eps>1) {eps/=2}
printf("%22.16e\n",2*eps)
exit
}    

