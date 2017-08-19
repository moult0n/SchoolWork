#ifndef _ABSENT_H_
#define _ABSENT_H_
// These two lines of preprocessor directives, and the one at the end: #endif,  
// prevent the header file from being included (linked in) multiple times, 
// when it is used multiple times by the user.

#include <string>
using namespace std;

class Absent {
private:
	// private local variables
	string date;

public:
	Absent *next;
	Absent(string date); // constructor
	string getDate(); // accessor
};

#endif // _ABSENT_H_
