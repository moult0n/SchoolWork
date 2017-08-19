// READ BEFORE YOU START:
// You are given a partially completed program that creates a list of students.
// Each student has the corresponding information: name, standard, and result.
// In the Student.h file, you will find the definition for this enum 'result'.
// Students on the list can have 2 different 'result's : either pass or fail.
// The classes Pass and Fail are subclasses of the Student class (found in Student.h).
// Both of these classes will have their own use of the virtual display method.
//
// To begin, you should trace through the given code and understand how it works.
// Please read the instructions above each required function and follow the directions carefully.
// If you modify any of the given code, the return types, or the parameters, you risk failing the automated test cases.
//
// You are to assume that all input is valid:
// Valid name:	String containing alphabetical letters beginning with a capital letter
// Valid standard: String containing alphabetical letters beginning with a number
// All input will be a valid length and no more than the allowed amount of memory will be used


#include "Container.h"
#include "Student.h"
#include "Pass.h"
#include "Fail.h"

#include <iostream>
#include <fstream>
#include <string>

using namespace std;

// forward declarations
void flush();
void branching(char);
void registration(char);
void add_student(string, string, Result);
Student* search_student(string, string, Result);
void remove_student(string, string, Result);
void remove_all();
void print_all();

void save(string); // 10 points
void load(string); // 10 points

Container* list = NULL; // global list

int main()
{
	_CrtSetDbgFlag(_CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF); // Use to check for memory leaks in VS

	load("Students.txt");

	char ch = 'i';

	do {
		cout << "Please enter your selection" << endl;
		cout << "\ta: add a new student to the list" << endl;
		cout << "\tc: change the standard of a student" << endl;
		cout << "\tr: remove a student from the list" << endl;
		cout << "\tp: print all students on the list" << endl;
		cout << "\tq: quit and save list of students" << endl;
		cin >> ch;
		flush();
		branching(ch);
	} while (ch != 'q');

	save("Students.txt");
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
	Result result;
	int result_check = -1;

	if (c == 'p')
		print_all();
	else
	{
		cout << endl << "Please enter the student's name: " << endl;
		cin >> name;
		cout << "Please enter the student's standard: " << endl;
		cin >> standard;

		while (!(result_check == 0 || result_check == 1))
		{
			cout << endl << "Please select one of the following: " << endl;
			cout << "0. Pass " << endl;
			cout << "1. Fail" << endl;
			cin >> result_check;
		}

		result = (Result)result_check;

		Student* student_result = search_student(name, standard, result);

		if (c == 'a') // add student
		{
			if (student_result == NULL)
			{
				add_student(name, standard, result);
				cout << endl << "Student added." << endl << endl;
			}
			else
				cout << endl << "Student already on list." << endl << endl;
		}
		else if (c == 'c') // change student standard
		{
			if (student_result == NULL)
			{
				cout << endl << "Student not found." << endl << endl;
				return;
			}

			cout << endl << "Please enter the new standard for this student: " << endl;
			cin >> standard; flush();

			changeStandard(student_result, standard);

			cout << endl << "Student's standard changed." << endl << endl;
		}
		else if (c == 'r') // remove pet
		{
			if (student_result == NULL)
			{
				cout << endl << "Student not found." << endl << endl;
				return;
			}

			remove_student(name, standard, result);
			cout << endl << "Student removed from the list." << endl << endl;
		}
	}
}

// Q3b: Define Friend Function Change Standard
// Define the function changeStandard that is declared within the Student.h file.
// This function sets the standard value of the Student pointer to the value of the string parameter.
void changeStandard(Student* student, string s) {
	student->standard = s;
}

// Q4: Add Student
// This function will be used to add a new student to the tail of the global linked list.
// You will need to use the enum ‘result’ variable to determine which constructor to use.
// Remember that search is called before this function, therefore, the new student is not on the list.
void add_student(string name, string standard, Result result)
{
	Container* containerTemp = new Container();
	Container* containerPtr = list;
	Pass* passTemp = new Pass(name, standard, result);
	Fail* failTemp = new Fail(name, standard, result);
	if (result == 0) { //pass case		
		containerTemp->student = passTemp;
		delete(failTemp);
	}
	else { //fail case
		containerTemp->student = failTemp;
		delete(passTemp);
	}
	if (list == NULL) {
		list = containerTemp;
		return;
	}
	while (containerPtr->next != NULL) {
		containerPtr = containerPtr->next;
	}
	containerPtr->next = containerTemp;

}

// No implementation needed here, however it may be helpful to review this function
Student* search_student(string name, string standard, Result result)
{
	Container* container_traverser = list;

	while (container_traverser != NULL)
	{
		if (container_traverser->student->getName() == name 
			&& container_traverser->student->getStandard() == standard
			&& container_traverser->student->getResult() == result)
			return container_traverser->student;

		container_traverser = container_traverser->next;
	}

	return NULL;
}

// No implementation needed here, however it may be helpful to review this function
void remove_student(string name, string standard, Result result)
{
	Container* to_be_removed;

	if (list->student->getName() == name
		&& list->student->getStandard() == standard
		&& list->student->getResult() == result)
	{
		to_be_removed = list;
		list = list->next;
		delete to_be_removed->student;
		delete to_be_removed;
		return;
	}

	Container* container_traverser = list->next;
	Container* container_follower = list;

	while (container_traverser != NULL)
	{
		if (container_traverser->student->getName() == name
			&& container_traverser->student->getStandard() == standard
			&& container_traverser->student->getResult() == result)
		{
			to_be_removed = container_traverser;
			container_traverser = container_traverser->next;
			container_follower->next = container_traverser;
			delete to_be_removed->student;
			delete to_be_removed;
			return;
		}
		container_follower = container_traverser;
		container_traverser = container_traverser->next;
	}
}

// No implementation needed here, however it may be helpful to review this function
void remove_all()
{
	while (list != NULL)
	{
		Container* temp = list;
		list = list->next;
		delete temp->student;
		delete temp;
	}
}

// This function uses the virtual display() method of the Dog and Cat classes to print all Pets in an oragnized format.
void print_all()
{
	Container *container_traverser = list;

	if (list == NULL)
		cout << endl << "List is empty!" << endl << endl;

	while (container_traverser != NULL)
	{
		container_traverser->student->display();
		container_traverser = container_traverser->next;
	}
}

// Q5a: Save (5 points)
// Save the linked list of pets to a file using ofstream.
// You will need to come up with a way to store the amount of Containers in linked list.
// Hint: You may want to cast the enum 'result' to an int before writing it to the file.
void save(string fileName)
{
	ofstream file(fileName);
	Container *container_traverser = list;
	if (list != NULL) {
		if (file.is_open()) {
			while (container_traverser != NULL) {
				string name = container_traverser->student->getName();
				string standard = container_traverser->student->getStandard();
				int result = container_traverser->student->getResult();
				file << name << ":" << standard << ":" << result << "\n";
				container_traverser = container_traverser->next;
			}
			file.close();
		}
		else
			cout << endl << "Unable to open file." << endl << endl;
	}
	else
		cout << endl << "List is empty! There is nothing to save." << endl << endl;
}

// Q5b: Load (5 points)
// Load the linked list of pets from a file using ifstream.
// You will need to create the linked list in the same order that is was saved to a file.
// You will need to create a new node for the linked list, then add it to the tail of the list. 
// Hint: If you casted the enum 'result' to an int, you will need to cast it back to a 'Type'.
// You will use the 'result' variable read from the file to determine which constructor to use.
void load(string fileName)
{
	ifstream file(fileName);
	Container *tempListHead = NULL;
	Container *tempPtr = NULL;
	string name;
	string standard;
	string resultString;
	int result;
	if (file.is_open()) {
		while (file.get() != -1) {
			file.unget();
			getline(file, name, ':');
			getline(file, standard, ':');
			getline(file, resultString);
			result = stoi(resultString);
			Container* containerTemp = new Container();
			Pass* passTemp = new Pass(name, standard, static_cast<Result>(result));
			Fail* failTemp = new Fail(name, standard, static_cast<Result>(result));
			if (result == 0) { //pass case				
				containerTemp->student = passTemp;
				delete(failTemp);
			}
			else { //fail case				
				containerTemp->student = failTemp;
				delete(passTemp);
			}
			if (tempListHead == NULL) { //head case
				tempListHead = containerTemp;
				tempPtr = tempListHead;
			}
			else {//tail case
				tempPtr->next = containerTemp;
				tempPtr = tempPtr->next;
			}
		}
	}
	else
		cout << endl << "Unable to open file." << endl << endl;
	list = tempListHead;
}
