#include "Pass.h"
#include "Student.h"
#include <iostream>
#include <string>

// Q2a: Define Display for Pass class
// Define the method display that you declared within the Pass class in the header file
// Information should be printed in the following format:
// Name: <name>
// Standard: <standard>
// Result: pass 
// (See the print_all function in hw10.cpp for proper use of this function.)


void Pass::display() { 
	std::cout << "Name: " << Student::getName() << "\n";
	std::cout << "Standard: " << Student::getStandard() << "\n";
	std::cout << "Result: " << Student::getResult() << "\n";
}

