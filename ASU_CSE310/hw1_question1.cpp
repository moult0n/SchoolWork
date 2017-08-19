#include <cmath>
#include <iostream>

using namespace std;

int main() {
	double a, b, c, d, n; // c is insertion and d is mergesort
	double i = 1.0;
	cout << "Enter a and b values: ";
	cin >> a;
	cin >> b;

	do {
		n = pow(2, i);
		c = a*pow(n, 2.0);
		d = b*n*log2(n);
		cout << "For n = " << n << " : Insertion sort = " << c << " merge sort = " << d << ".\n";
		i = i++;
	} while (c < d);
	cout << "Value of n that insertion sort beats merge sort is: " << n << "\n";
	system("Pause");
	return 0;
}