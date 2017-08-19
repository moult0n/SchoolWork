#include <iostream>
#include <string>
#include <cmath>
#include <random>
#include <ctime>
#include <ratio>
#include <chrono>
#include <iterator>

using namespace std;

void runningTimeB() {
	double n[] = { 1000.0, 10000.0, 25000.0, 50000.0, 100000.0, 150000.0, 200000.0 };
	int length = 7;
	double iS[7];
	double mS[7];
	for (int i = 0; i < 7; i++) {
		iS[i] = pow(n[i], 2.0);
		mS[i] = n[i] * log2(n[i]);
	}
	cout << "Inserstion sort theoretical time: " << iS[0] << " " << iS[1] << " " << iS[2] << " " << iS[3] << " " << iS[4] << " " << iS[5] << " " << iS[6] << "\n";
	cout << "Merge sort theoretical time: " << mS[0] << " " << mS[1] << " " << mS[2] << " " << mS[3] << " " << mS[4] << " " << mS[5] << " " << mS[6] << "\n";
	cout << "Quick sort theoretical time: " << mS[0] << " " << mS[1] << " " << mS[2] << " " << mS[3] << " " << mS[4] << " " << mS[5] << " " << mS[6] << "\n";
}

void insertionSort(double *A, int n) {
	double key;
	int i;
	for (int j = 1; j < n; j++) {
		key = A[j];
		i = j - 1;
		while (i > 0 && A[i] > key) {
			A[i + 1] = A[i];
			i--;
		}
		A[i + 1] = key;
	}
}

void merge(double *A, int p, int q, int r) {
	int n1 = q - p + 1;
	int n2 = r - q;
	int i = 0;
	int j = 0;
	double *lA = new double[n1 + 1];
	double *rA = new double[n2 + 1];
	for (i = 0; i < n1; i++) {
		lA[i] = A[p + i];
	}
	for (int j = 0; j < n2; j++) {
		rA[j] = A[q + j];
	}
	lA[n1] = std::numeric_limits<double>::max();
	rA[n2] = std::numeric_limits<double>::max();
	i = 0;
	j = 0;
	for (int k = p; k <= r; k++) {
		if (lA[i] <= rA[j]) {
			A[k] = lA[i];
			i++;
		}
		else {
			A[k] = rA[j];
			j++;
		}
	}
}

void mergeSort(double *A, int p, int r) {
	if (p < r) {
		int q = (p + r) / 2;
		mergeSort(A, p, q);
		mergeSort(A, q + 1, r);
		merge(A, p, q, r);
	}
}

int partition(double *A, int p, int r) {
	double x = A[r];
	int i = p - 1;
	for (int j = p; j <= (r - 1); j++) {
		if (A[j] <= x) {
			i = i + 1;
			swap(A[i], A[j]);
		}
	}
	swap(A[i + 1], A[r]);
	return i + 1;
}

void quickSort(double *A, int p, int r) {
	if (p < r) {
		int q = partition(A, p, r);
		quickSort(A, p, q - 1);
		quickSort(A, q + 1, r);
	}
}

typedef std::chrono::high_resolution_clock Time;
typedef std::chrono::milliseconds ms;
typedef std::chrono::duration<double> dsec;

int main() {
	runningTimeB();

	double lb = 100.00;
	double ub = 1000.00;
	uniform_real_distribution<double> unif(lb, ub);
	default_random_engine dre;
	int n[] = { 1000, 10000, 25000, 50000, 100000, 150000, 200000 };
	int lengthN = 7;
	dsec timeIS[7];
	dsec timeMS[7];
	dsec timeQS[7];

	for (int i = 0; i < lengthN; i++) {
		double *A = new double [n[i]];
		double *B = new double [n[i]];
		double *C = new double [n[i]];
		for (int j = 0; j < n[i]; j++) {
			A[j] = unif(dre);
			B[j] = unif(dre);
			C[j] = unif(dre);
		}

		auto t1 = Time::now();
		insertionSort(A,n[i]);
		auto t2 = Time::now();
		dsec td = t2 - t1;
		timeIS[i] = std::chrono::duration_cast<ms>(td);

		t1 = Time::now();
	    mergeSort(B,1,(n[i]-1));
		t2 = Time::now();
		td = t2 - t1;
		timeMS[i] = std::chrono::duration_cast<ms>(td);

		t1 = Time::now();
		quickSort(C, 1, (n[i] - 1));
		t2 = Time::now();
		td = t2 - t1;
		timeQS[i] = std::chrono::duration_cast<ms>(td);

		delete(A);
		delete(B);
		delete(C);
	}
	cout << "\n\n\n";
	cout << "Inserstion sort actual time: " << timeIS[0].count() << " " << timeIS[1].count() << " " << timeIS[2].count() << " " << timeIS[3].count() << " " << timeIS[4].count() << " " << timeIS[5].count() << " " << timeIS[6].count() << "\n";
	cout << "Merge sort actual time: " << timeMS[0].count() << " " << timeMS[1].count() << " " << timeMS[2].count() << " " << timeMS[3].count() << " " << timeMS[4].count() << " " << timeMS[5].count() << " " << timeMS[6].count() << "\n";
	cout << "Quick sort actual time: " << timeQS[0].count() << " " << timeQS[1].count() << " " << timeQS[2].count() << " " << timeQS[3].count() << " " << timeQS[4].count() << " " << timeQS[5].count() << " " << timeQS[6].count() << "\n";


	system("Pause");
	return 0;
}

