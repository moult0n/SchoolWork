#ifndef _FAIL_H_
#define _FAIL_H_

#include "Student.h"
#include <iostream>
#include <string>

// Q1b: Create Fail Class
// Part 1: Create a child class of the Student class named 'Fail'
// See the add function in hw10.cpp for proper use of this function.
// Part2: Declare constructor which accepts the same 3 parameters as the parent class Student.
// Pass the 3 parameters to the super constructor in the Student class.
// Part 3: Re-declare the method display (virtual method found inside of parent class Student)
class Fail : public Student
{
public:
	Fail(std::string student_name, std::string student_standard, Result student_result) :Student(student_name, student_standard, student_result) {};

	void display();
};
#endif