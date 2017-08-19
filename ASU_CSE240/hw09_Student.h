#ifndef _STUDENT_H_
#define _STUDENT_H_
// These two lines of preprocessor directives, and the one at the end #endif,  
// prevent the header file from being included (linked in) multiple times, 
// when it is used multiple times by the user.

#include "Absent.h"

#include <string>
using namespace std;

class Student {
private:
	string name, standard; // private local variables

public:
	Student(string student_name, string student_standard); // constructor

	Absent *absents; // linked list of absents

	// accessor methods
	string getName();
	string getStandard();

	// class methods
	void addAbsent(string date);
	string lastAbsent();
};

#endif // _STUDENT_H_
