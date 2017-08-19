#ifndef _STUDENT_H_
#define _STUDENT_H_

#include <string>
using namespace std;

enum Result { pass = 0, fail };

class Student {
private:
	string name, standard; // private local variables
	Result result;

public:
	Student(string student_name, string student_standard, Result student_result); // constructor

	// accessor methods
	string getName();
	string getStandard();
	Result getResult();

    // Q3a: Declare Friend Function Change Standard
	// Declare a “friend function” named changeBreed which has 2 parameters and no return value.
	// The first parameter is a pointer to a Student, and the second is a string.
	// See the helper function in hw10.cpp for proper use of this function.

	virtual void display() {};
	friend void changeStandard(Student* student, string s);
};

#endif // _STUDENT_H_
