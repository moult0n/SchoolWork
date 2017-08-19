// READ BEFORE YOU START:
// You are given a partially completed program that creates a list of pets with their list of absents.
// Each student has the corresponding information: name, standard, and a linked list of absents.
// To begin, you should trace through the given code and understand how it works.
// Please read the instructions above each required function and follow the directions carefully.
// If you modify any of the given code, the return types, or the parameters, you risk failing the automated test cases.
//
// You are to assume that all input is valid:
// Valid name:	String containing alphabetical letters beginning with a capital letter
// Valid standard: String containing alphabetical letters beginning with a number
// Valid date:	String in the following format: "MM/DD/YYYY" ex: "01/01/2010"
// All input will be a valid length and no more than the allowed amount of memory will be used
//
// Q1 : CLASS METHODS Part 1 : Constructor and Accessor Methods for Student class in Student.cpp file	( 5 points)
// Q2 : CLASS METHODS Part 2 : Class methods for Student class in Student.cpp file						(10 points)
// Q3 : Add Function in hw09.cpp file															( 5 points)
// Q4 : Search Function in hw09.cpp file														(10 points)
// Q5 : Remove One Function in hw09.cpp file													(15 points)
// Q6 : Implement cin / cout for the lines in main without modifying the functionality			( 5 points)

#include <iostream>
#include <fstream>
#include <string>

#include "Container.h"
#include "Student.h"
#include "Absent.h"

using namespace std;

// forward declarations
void flush();
void branching(char);
void registration(char);
void add_student(string, string);
Student* search_student(string, string);
void remove_student(string, string);

void print_all();
void remove_all();

Container* list = NULL; // global list

int main()
{
//	_CrtSetDbgFlag(_CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF); // Use to check for memory leaks in VS

	char ch = 'i';

	do {

		// Q6: Implement cin / cout for the lines below without modifying the functionality (5 points)
		// (change all printf statements to cout and read the next char using cin)
		cout << "Please enter your selection\n";
		cout << "\ta: add a new student to the list\n";
		cout << "\tc: add a new absent for a student\n";
		cout << "\tr: remove a student from the list\n";
		cout << "\tp: print all students on the list\n";
		cout << "\tq: quit\n";
		cin >> ch;
		// End Q6

		flush();
		branching(ch);
	} while (ch != 'q');

	remove_all();
	list = NULL;
	return 0;
}

void flush()
{
	int c;
	do c = getchar(); while (c != '\n' && c != EOF);
}

void branching(char c)
{
	switch (c) {
	case 'a':
	case 'c':
	case 'r':
	case 'p':
		registration(c);
		break;
	case 'q':
		break;
	default:
		printf("\nInvalid input!\n\n");
	}
}

// The registration function is used to determine how much data is needed and which function to send that data to.
// It uses pointers and values that are returned from some functions to produce the correct ouput.
// There is no implementation needed here, but you should study this function and know how it works.
// It is always helpful to understand how the code works before implementing new features.
// Do not change anything in this function or you risk failing the automated test cases.
void registration(char c)
{
	string name, standard;

	if (c == 'p')
		print_all();
	else
	{
		cout << endl << "Please enter the student's name: " << endl;
		cin >> name;
		cout << "Please enter the student's standard: " << endl;
		cin >> standard; flush();

		Student* student_result = search_student(name, standard);

		if (c == 'a') // add student
		{
			if (student_result == NULL)
			{
				add_student(name, standard);
				cout << endl << "Student added." << endl << endl;
			}
			else
				cout << endl << "Student already on list." << endl << endl;
		}
		else if (c == 'c') // add absent
		{
			if (student_result == NULL)
			{
				cout << endl << "Student not found." << endl << endl;
				return;
			}

			string date;
			cout << "Please enter the date of the absent: " << endl;
			cin >> date; flush();

			student_result->addAbsent(date);
			cout << endl << "Absent added." << endl << endl;
		}
		else if (c == 'r') // remove student
		{
			if (student_result == NULL)
			{
				cout << endl << "Student not found." << endl << endl;
				return;
			}

			remove_student(name, standard);
			cout << endl << "Student removed from the list." << endl << endl;
		}
	}
}

// Q3: Add Student (5 points)
// This function will be used to add a new student to the head of you linked list of containers, no need for sorting.
// The search function is called before this function, therefore you can assume the student is not already on the list.
// If the student is added to the list, return 1. If the student already exists on the list (not added), return 0.
void add_student(string name, string standard)
{	
	if (list == NULL) {
		list = new Container();
		list->student = new Student(name, standard);
		return;
	}
	Container *tempContainer = new Container();
	tempContainer->student = new Student(name, standard);
	tempContainer->next = list;
	list = tempContainer;
}

// Q4: Search (10 points)
// This function will be used to search for a student on the list. 
// Students on the list may have the same name OR the same standard, but should not have the same name AND standard.
// Therefore, you must traverse the list and return a pointer to a 'Student' with the desired name AND standard.
// If the student does not exist on the list, return NULL. (See registration function for use of this function).
Student* search_student(string name, string standard)
{
	Container *ptr = list;
	while (ptr != NULL) {
		if (ptr->student->getName() == name && ptr->student->getStandard() == standard) {
			return ptr->student;
		}
		ptr = ptr->next;
	}
	return NULL;
}


// Q5: Remove Pet (15 points)
// This function will be used to remove a student from the list. 
// Traverse the list and use the parameters to remove the student.
// Use proper memory management to ensure no memory leaks.
void remove_student(string name, string standard)
{
	Container *ptr = list;
	Container* container_to_be_removed;
	if (ptr->student->getName() == name && ptr->student->getStandard() == standard) {
		container_to_be_removed = ptr;
		list = ptr->next;
		while (container_to_be_removed->student->absents != NULL)
		{
			Absent *absent_to_be_removed = container_to_be_removed->student->absents;
			container_to_be_removed->student->absents = container_to_be_removed->student->absents->next;
			delete absent_to_be_removed;
		}

		delete container_to_be_removed->student;
		delete container_to_be_removed;
		return;
	}
	while (ptr->next != NULL) {
		if (ptr->next->student->getName() == name && ptr->next->student->getStandard() == standard) {
			container_to_be_removed = ptr->next;
			ptr->next = ptr->next->next;
			while (container_to_be_removed->student->absents != NULL)
			{
				Absent *absent_to_be_removed = container_to_be_removed->student->absents;
				container_to_be_removed->student->absents = container_to_be_removed->student->absents->next;
				delete absent_to_be_removed;
			}

			delete container_to_be_removed->student;
			delete container_to_be_removed;
			return;
		}
		ptr->next = ptr->next->next;
	}
}

// This function is already implemented for you. It traverses the list and removes all pets to ensure no memory leaks.
void remove_all()
{
	while (list != NULL)
	{
		Container* container_to_be_removed = list;
		list = list->next;

		while (container_to_be_removed->student->absents != NULL)
		{
			Absent *absent_to_be_removed = container_to_be_removed->student->absents;
			container_to_be_removed->student->absents = container_to_be_removed->student->absents->next;
			delete absent_to_be_removed;
		}

		delete container_to_be_removed->student;
		delete container_to_be_removed;
	}
}

// This function is already implemented for you. It prints all of the pets in the list in an organized format.
void print_all()
{
	if (list == NULL) cout << endl << "List is empty!" << endl << endl;
	Container *container_traverser = list;
	while (container_traverser != NULL)	{

		cout << endl <<"Name: " << container_traverser->student->getName() << endl << "Standard: " << container_traverser->student->getStandard() << endl;
		string last_absent = container_traverser->student->lastAbsent();
		if (last_absent.empty())
			cout << "Last Absent: " << "N/A" << endl << endl;
		else
			cout << "Last Absent: " << last_absent << endl << endl;
		container_traverser = container_traverser->next;
	}
}


