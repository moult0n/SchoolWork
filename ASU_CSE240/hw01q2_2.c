/* This C program demonstrates the switch statement without using breaks. */
/* The program is tested on MS Visual C++ platform */
#include <stdio.h>
#pragma warning(disable : 4996) // Remove this line in Unix GCC environment
void main() {
	char ch;
	ch = '+';
	int f, a = 10, b = 20;
	for (int i = 1; i <= 5; i++) {
		scanf(" %c", &ch);
		switch (ch) {
		case '+': 
			f = a + b; 
			printf("f = %d\n", f); 
			break;
		case '-': 
			f = a - b; 
			printf("f = %d\n", f); 
			break;
		case '*': 
			f = a * b; 
			printf("f = %d\n", f); 
			break;
		case '/': 
			printf("f = %g\n", (float)a / (float)b); 
			break;
		default: 
			printf("invalid operator\n");
			break;
		}
	}

}