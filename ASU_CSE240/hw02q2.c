#include <stdio.h>

#define subm(a,b) (a-b)
#define cubem(a) ((a)*(a)*(a)) 
#define minm(a,b) (((a) < (b)) ? (a) : (b))
#define oddm(a) ((a%2==0)?0:1)

int subf(int a, int b) { return a - b; }
int cubef(int a) { return a*a*a; }
int minf(int a, int b) {
	if (a <= b) {
		return a;
	}
	else {
		return b;
	}
}
int oddf(int a) {
	if (a % 2 == 0) {
		return 0;
	}
	else {
		return 1;
	}
}

void main() {
	int a = 5, b = 7;
	printf("%d\n",subf(a, b));
	printf("%d\n", subm(a, b));
	printf("%d\n", subf(a++, b--));
	printf("%d\n", subm(a++, b--));
	printf("%d\n", cubef(a));
	printf("%d\n", cubem(a));
	printf("%d\n", cubef(--a));
	printf("%d\n", cubem(--a));
	printf("%d\n", minf(a, b));
	printf("%d\n", minm(a, b));
	printf("%d\n", minf(--a, --b));
	printf("%d\n", minm(--a, --b));
	printf("%d\n", oddm(a));
	printf("%d\n", oddf(a));
	printf("%d\n", oddf(a++));
	printf("%d\n", oddm(a++));

}

