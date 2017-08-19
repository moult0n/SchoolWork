#include <stdio.h>
#pragma warning(disable : 4996) 

// CSE 240 Fall 2016 Homework 2 Question 3 (25 points)
// Note: You may notice some warnings for variables when you compile in GCC, that is okay.

#define macro_1(x) ((x > 0) ? x : 0)
#define macro_2(a, b) (3*a - 3*b*b + 4*a * b - a*b * 10)

int function_1(int a, int b) { 
	return (3*a - 3*b*b + 4*a * b - a*b * 10); 
}

// Part 1:
// It appears that the result of macro_1 should be 5, why is the result 6? Correct the error. (5 points)
void part1(int x) {

	int m = x, result;
	++m;
	result = macro_1(m);

	printf("macro_1(%d) = %d\n\n", (++x), result);
	
	// Why did this error occur? Please provide the answer in your own words below following "Explanation: "
	printf("Explanation: The incrementation was being passed into the macro because it was a pre incrementation instead of post incrementation. Thus x is being increased at both instances of x within macro_1. Therefore you get 6 instead of 5. Incrementing before calling the macro fixes this issue.\n\n\n"); // (5 points)
}


// Part 2:
// Run this program in Visual Studio and then again in GCC. Take note of the output values for function_1(x,y) and macro_2(x,y).
void part2(int x, int y) {
	int i, j, s, t;

	s = i = x;	// initialize variables with value from x
	t = j = y;  // initialize variables with value from y

	printf("function_1(x, y) = %d\nmacro_2(x, y) = %d\n\n", function_1(++i, ++j), macro_2(++s, ++t));

	// Replace the 4 '__' spaces below with the actual output observed when running the code in VS and GCC.
	printf("In VS : the result of function_1(x, y) = -273 and macro_2(x, y) = -600 \n"); // (5 points)
	printf("In GCC: the result of function_1(x, y) = -273 and macro_2(x, y) = -549 \n\n"); // (5 points)

	// Explain why Visual Studio and GCC programming environments could possibly produce a different value for the same program and for the same input.
	printf("Explanation: The enviroments could be getting different answers for the macro input because of the order inwhich the commands where executed. For example visual studio could be multiplying first then doing to addition and subtraction, while gcc could be running theoperation in the order they are presented in.\n\n"); //  (5 points)
}

// Do not edit any of the following code  
int main()
{
	int x = 4, y = 5;

	printf("Part 1:\n\n");
	part1(x);
	printf("Part 2:\n\n");
	part2(x, y);

	return 0;
}
