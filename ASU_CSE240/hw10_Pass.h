#ifndef _PASS_H_
#define _PASS_H_

#include "Student.h"
#include <iostream>
#include <string>

// Q1a: Create Pass Class
// Part 1: Create a child class of the Student class named 'Pass'
// See the add function in hw10.cpp for proper use of this function.
// Part2: Declare constructor which accepts the same 3 parameters as the parent class Student.
// Pass the 3 parameters to the super constructor in the Student class.
// Part 3: Re-declare the method display (virtual method found inside of parent class Student)

class Pass : public Student
{
public:
	Pass(std::string student_name, std::string student_standard, Result student_result) : Student(student_name, student_standard, student_result) {};	
	void display();
};
#endif