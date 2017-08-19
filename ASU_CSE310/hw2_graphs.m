a = [0 .1 .539 1.498 5.87 13.166 23.564];
b = [.001 .009 .02 .028 .058 .092 .117];
c = [.001 .014 .032 .053 .125 .19 .287];
n = [1000, 10000, 25000, 50000, 100000, 150000, 200000];
ms = n.*log2(n);
is = n.^2;
figure
plot(n, a)
title('Insertion Sort Actual')

figure
plot(n, b)
title('Merge Sort Actual')

figure
plot(n, c)
title('Quick Sort Actual')

figure 
plot(n, is)
title('Insertion Sort Theorectical')

figure
plot(n, ms)
title('Merge Sort Theorectical')

figure
plot(n, ms)
title('Quick Sort Theorectical')