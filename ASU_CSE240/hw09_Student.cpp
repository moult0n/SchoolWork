#include "Student.h"

// Q1 : CLASS METHODS Part 1 : Constructor and Accessor Methods for Student (5 points)

// Constructor
// Create a constructor for the class Student which takes 2 string parameters (see helper function for use of constructor).
// Use the 2 string parameters to initialize the 2 private local variables name and standard.
// HINT: Don't forget to initialize your linked list of absents to NULL.

//ENTER CODE HERE
Student::Student(string student_name, string student_standard) {
	Student::name = student_name;
	Student::standard = student_standard;
	absents = NULL;
}

// Accessor Methods
// Create accessor methods for both private local strings name and standard (see print_all function for use of these methods).

//ENTER CODE HERE
string Student::getName() {
	return name;
}
string Student::getStandard() {
	return standard;
}

// Q2 : CLASS METHODS Part 2 : Class Methods for Students (10 points)

// Create a method named "addAbsent" which has one string parameter and no return type (see helper function for use).
// This method is used to add a new date to the student's linked list of absents. The string parameter is the date of absents.
// You should add the date to the tail of the linked list "absents". Absents will be added in chronological order.

//ENTER CODE HERE
void Student::addAbsent(string date) {
	Absent *temp = new Absent(date);
	temp->next = NULL;
	if (Student::absents == NULL) { 
		absents = temp;
		return;
	}
	Absent *ptr = absents;
	while (ptr->next != NULL) {
		ptr = ptr->next;
	}
	ptr->next = temp;
}

// Create a method named "lastAbsent" which has no parameters and returns a string (see print_all function for use).
// This method will be used to return a string for the date of the last checkup for this student.
// If the student has not yet had an absent, return an empty string.

//ENTER CODE HERE
string Student::lastAbsent() {
	Absent *ptr = absents;
	if (ptr == NULL) {
		return "";
	}
	while (ptr->next != NULL) {
		ptr = ptr->next;
	}
	return ptr->getDate();
}
