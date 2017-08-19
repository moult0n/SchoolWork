#include "Fail.h"
#include "Student.h"
#include <iostream>

// Q2b: Define Display for Fail class
// Define the method display that you declared within the Fail class in the header file
// Information should be printed in the following format:
// Name: <name>
// Standard: <standard>
// Result: fail
// (See the print_all function in hw10.cpp for proper use of this function.)


void Fail::display() {
	std::cout << "Name: " << Student::getName() << "\n";
	std::cout << "Standard: " << Student::getStandard() << "\n";
	std::cout << "Result: " << Student::getResult() << "\n";
}
