// READ BEFORE YOU START:
// Please read the given Word document for the project description with an illustrartive diagram.
// You are given a partially completed program that creates a list of students for a school.
// Each student has the corresponding information: name, standard, and a linked list of absents.
// Please read the instructions above each required function and follow the directions carefully.
// If you modify any of the given code, return types, or parameters, you risk failing test cases.
//
// Note, Textbook Section 2.10 gives a case study on complex linked list operations. 
// This project is based on that case study. Make sure you read the code in section 2.10.

// The following will be accepted as input in the following format: "name:standard"
// Example Input:	"Tom:2nd" or "Daisy:3rd"
// Valid name:		String containing alphabetical letters beginning with a capital letter
// Valid standard:		String containing alphabetical letters beginning with a number eg: 1st 2nd
// Valid date:		String in the following format: "MM/DD/YYYY" ex: "01/01/2010"
// All input will be a valid length and no more than the allowed number of dogs will be added to the linked list.

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// included to check for memory leaks
#define CRTDBG_MAP_ALLOC
#include <crtdbg.h>

#pragma warning(disable: 4996)

// used to create a linked list of containers, each contaning a "student"
struct container {
	struct student *student;
	struct container *next;
} *list = NULL;

// used to hold student information and linked list of "absents"
struct student {
	char name[30];
	char standard[30];
	struct absent *absents;
};

// used to create a linked list of absents containing "dates"
struct absent {
	char date[30];
	struct absent *next;
};


// forward declaration of functions that have already been implemented
void flush();
void branching(char);
void registration(char);
void remove_all(struct container*);
void display(struct container*);

// the following forward declarations are for functions that require implementation

// return type		// name and parameters				// points
void				add_student(char*, char*);				//  5
struct student*			search_student(char*);					//  5
void				add_absent(char*, char*);			// 10
char*				last_absent(char*);				// 15
void				remove_one(char*);					// 15
//													Total: 50 points for hw07

struct container*	list_of_standard(char*);				// 25
struct container*	list_by_name();						// 25
//																					Total: 50 points for hw08

struct student* search_list(char* name, struct student **list); //why wasnt the original search not list independent?
struct student* copy_student(struct student **toCopy);

int main()
{
	char ch = 'i';

	printf("Student Information\n\n");

	do
	{
		printf("Please enter your selection:\n");
		printf("\ta: add a new student to the list\n");
		printf("\ts: search for a student on the list\n");
		printf("\tr: remove a student from the list\n");
		printf("\tc: add an absence date for a student\n");
		printf("\tl: display last absence date for a student\n");
		printf("\tn: display list of students by name\n");
		printf("\tb: display list of students of a given standard\n");
		printf("\tq: quit\n");
		ch = tolower(getchar());
		flush();
		branching(ch);
	} while (ch != 'q');

	remove_all(list);
	list = NULL;

	_CrtDumpMemoryLeaks(); // check for memory leaks (VS will let you know in output if they exist)

	return 0;
}

// consume leftover '\n' characters
void flush()
{
	int c;
	do c = getchar(); while (c != '\n' && c != EOF);
}

// branch to different tasks
void branching(char c)
{
	switch (c)
	{
	case 'a':
	case 's':
	case 'r':
	case 'c':
	case 'l':
	case 'b':
	case 'n': registration(c); break;
	case 'q': break;
	default: printf("Invalid input!\n");
	}
}

// This function will determine what info is needed and which function to send that info to.
// It uses values that are returned from some functions to produce the correct ouput.
// There is no implementation needed here, but you should trace the code and know how it works.
// It is always helpful to understand how the code works before implementing new features.
// Do not change anything in this function or you risk failing the automated test cases.
void registration(char c)
{
	if (c == 'a')
	{
		char input[100];

		printf("\nPlease enter the student's info in the following format:\n");
		printf("name:standard\n");
		fgets(input, sizeof(input), stdin);

		// discard '\n' chars attached to input
		input[strlen(input) - 1] = '\0';

		char* name = strtok(input, ":"); // strtok used to parse string
		char* standard = strtok(NULL, ":");

		struct student* result = search_student(name);

		if (result == NULL)
		{
			add_student(name, standard);
			printf("\nStudent added to list successfully\n\n");
		}
		else
			printf("\nThat student is already on the list\n\n");
	}
	else if (c == 's' || c == 'r' || c == 'c' || c == 'l')
	{
		char name[30];

		printf("\nPlease enter the student's name:\n");
		fgets(name, sizeof(name), stdin);

		// discard '\n' chars attached to input
		name[strlen(name) - 1] = '\0';

		struct student* result = search_student(name);

		if (result == NULL)
			printf("\nThat student is not on the list\n\n");
		else if (c == 's')
			printf("\nStandard: %s\n\n", result->standard);
		else if (c == 'r')
		{
			remove_one(name);
			printf("\nStudent removed from the list\n\n");
		}
		else if (c == 'c')
		{
			char date[30];

			printf("\nPlease enter the date of absence:\n");
			fgets(date, sizeof(date), stdin);

			// discard '\n' chars attached to input
			date[strlen(date) - 1] = '\0';

			add_absent(name, date);
			printf("\nAbsent date added\n\n");
		}
		else if (c == 'l')
		{
			char* result = last_absent(name);
			if (result == NULL)
				printf("\nNo absence documented.\n\n");
			else
				printf("\nLast absent on: %s\n\n", result);
		}
	}
	else if (c == 'b')
	{
		char standard[30];

		printf("\nPlease enter the standard:\n");
		fgets(standard, sizeof(standard), stdin);

		// discard '\n' chars attached to input
		standard[strlen(standard) - 1] = '\0';

		struct container* result = list_of_standard(standard);

		printf("\nList of students with standard %s:\n\n", standard);

		display(result);
		remove_all(result);
		result = NULL;
	}
	else // c = 'n'
	{
		struct container* result = list_by_name();

		printf("\nList of students sorted by name:\n\n");

		display(result);
		remove_all(result);
		result = NULL;
	}
}

// This function recursively removes all students from the linked list of containers
// Notice that all of the absents for all of the students must be removed as well
void remove_all(struct container* students)
{
	struct absent* temp;
	if (students != NULL)
	{
		remove_all(students->next);
		while (students->student->absents != NULL)
		{
			temp = students->student->absents;
			students->student->absents = students->student->absents->next;
			free(temp);
		}
		free(students->student);
		free(students);
	}
}

// This function prints the list of students in an organized format
// It may be useful to trace this code before you get started
void display(struct container* students)
{
	struct container* container_traverser = students;

	if (container_traverser == NULL)
	{
		printf("\nThere are no students on this list!\n\n");
		return;
	}

	while (container_traverser != NULL) // traverse list of students
	{
		printf("Name: %s\n", container_traverser->student->name);
		printf("Standard: %s\n", container_traverser->student->standard);
		printf("Absence on file: ");

		struct absent* ptr = container_traverser->student->absents;
		if (ptr == NULL)
		{
			printf("No absence documented.");
		}
		else
		{
			while (ptr != NULL) // traverse list of absents
			{
				printf("\n%s", ptr->date);
				ptr = ptr->next;
			}
		}

		printf("\n\n"); // formatting
		container_traverser = container_traverser->next;
	}
}

// hw07 Q1 : add (5 points)
// This function should add student to the head of the list of containers.
// The function search_student() is called before calling this function, 
// therefore you can assume that the student is not already on the list.
void add_student(char* name, char* standard)
{
	struct container *containerPtr = list;
	struct student *studentTemp = (struct student*)malloc(sizeof(struct student));
	struct container *containerTemp = (struct container*)malloc(sizeof(struct container));
	strcpy(studentTemp->name, name);
	strcpy(studentTemp->standard, standard);
	studentTemp->absents = NULL;
	containerTemp->student = studentTemp;
	containerTemp->next = containerPtr;
	containerPtr = containerTemp;
	list = containerPtr;	
}

// hw07 Q2 : search (5 points)
// In this function, you are passed the name of a student to find his/her standard.
// If the student exists on the list, return a pointer to the requested student. If not, return NULL.
// (You must return a pointer to a node in your list. Do not create a pointer that just includes the standard)
// (Remember that it is enough to search for a student by only their name since no 2 students will have the same name)
struct student* search_student(char* name)
{
	struct container *ptr = list;
	while (ptr != NULL) {
		if (strcmp(ptr->student->name, name) == 0) {
			return ptr->student;
		}
		else
			ptr = ptr->next;
	}
	return NULL;
}

// hw07 Q3: add_absent (10)
// In this function, you are passed the name of a student and a date of absence.
// You should add the date to the tail of the linked list of the students "absents".
// You can assume that all absents will be added in chronological order.
// The function search_student() is called before calling this function, 
// therefore you can assume that the student is already on the student list and 
// the new absence date is not on the absents list.
void add_absent(char* name, char* date)
{
	struct absent *absentTemp = (struct absent*)malloc(sizeof(struct absent));
	struct student *studentTemp = search_student(name);
	struct absent *absentPtr = studentTemp->absents;
	strcpy(absentTemp->date, date);
	absentTemp->next = NULL;
	if (absentPtr != NULL) {
		while (absentPtr != NULL) {
			if (absentPtr->next == NULL) {
				absentPtr->next = absentTemp;
				break;
			}
			else
				absentPtr = absentPtr->next;
		}
	}
	else {
		absentPtr = absentTemp;
		studentTemp->absents = absentPtr;
	}
}

// hw07 Q4: last_absent (15)
// In this function, you are passed the name of a student to find the date of its last absent.
// Remember that absents are stored in chronological order,
// therefore the last checkup will be at the tail of the linked list of absents.
// If the student has not yet had an anbsent added to its list of absents, return NULL.
// The function search_student() is called before calling this function, 
// therefore you can assume that the student is not already on the list.
char* last_absent(char* name)
{
	struct student *studentTemp = search_student(name);
	struct absent *absentPtr = studentTemp->absents;
	while (absentPtr != NULL) {
		if (absentPtr->next == NULL) { break; }
		else
			absentPtr = absentPtr->next;
	}
	return absentPtr->date;
}

// hw07 Q5: remove_one (15)
// In this function, you are passed the name of a dog to remove the corresponding dog from the list.
// The search function is called before this function so you can assume that the dog is on the list.
// You will need to find the dog and remove it using proper memory management to ensure no memory leaks.
void remove_one(char* name)
{
	struct container *containerPtr = list, *location = 0; //*containerTemp = (struct container*)malloc(sizeof(struct container))
	struct absent *absentTemp = (struct absent*)malloc(sizeof(struct absent));
	while (containerPtr != NULL) {
		if (strcmp(containerPtr->student->name, name) == 0) {
			break; 
		}
		else {
			location = containerPtr;
			containerPtr = containerPtr->next;
		}
	}
	if (location == 0) {
		list = list->next;
		struct absent *absentPtr = containerPtr->student->absents;
		while (absentPtr != NULL) {
			absentTemp = absentPtr;
			absentPtr = absentPtr->next;
			free(absentTemp);
		}
		free(containerPtr->student);
		free(containerPtr);
		return;
	}
	else {
		location->next = containerPtr->next;
		struct absent *absentPtr = containerPtr->student->absents;
		while (absentPtr != NULL) {
			absentTemp = absentPtr;
			absentPtr = absentPtr->next;
			free(absentTemp);
		}
		free(containerPtr->student);
		free(containerPtr);
		return;
	}
}

/// hw08 Q1: list_of_standard (25)
// This function is used to construct a new linked list of containers from the global list of containers.
// The returned list should only contain students which are of the standard type parameter (container->student->standard).
// No sorting is required for this list.
// The list that you return will be cleaned up for you by the remove_all() function (see registration() function),
// however you will need to make sure that you leave no dangling references (those cause memory leaks too).
// Notice that the returned list will need to contain all student and checkup information to be displayed.
// This function should NOT modify the global linked list.
struct container* list_of_standard(char* standard)
{
	struct container *containerTemp = NULL;
	struct container *tempList = NULL; //return list
	struct container *tempListPtr = NULL; //pointer to return list elements
	struct container *containerPtr = list;   //pointer to original list elements

	while (containerPtr != NULL) {
		if (strcmp(containerPtr->student->standard, standard) == 0) {
			containerTemp = (struct container*)malloc(sizeof(struct container)); //create new memory for return list member
			containerTemp->student = copy_student(containerPtr->student); 
			containerTemp->next = NULL;
			if (tempList == NULL) { //empty list case
				tempList = containerTemp;
				tempListPtr = tempList;
			}
			else { //end of list case
				tempListPtr->next = containerTemp;
				tempListPtr = tempListPtr->next;
			}
		}
		containerPtr = containerPtr->next;
	}
	return tempList;
}

// hw08 Q2: list_by_name (25)
// This function is used to construct a new linked list of containers from the global list of containers.
// The returned list should be sorted alphabetically by each container's student's name (container->student->name).
// The list that you return will be cleaned up for you by the remove_all() function (see registration() function),
// however you will need to make sure that you leave no dangling references (those cause memory leaks too).
// Notice that the returned list will need to contain all student and absence information to be displayed.
// You can again assume that for this assignment, no 2 students on the list will have the same name.
// You may want to use the function that you have written above as a blueprint for this function.
// This function should NOT modify the global linked list.
struct container* list_by_name()
{
	struct container *containerTemp = NULL;
	struct container *tempList = NULL; //return list
	struct container *tempListPtr = NULL; //pointer to return list elements
	struct container *containerPtr = list;   //pointer to original list elements
	struct container *containerPtrSublist = NULL;   //pointer to original list elements
	
	char *smallest = NULL;
	
	while (containerPtr != NULL) {
		smallest = (char *)malloc(sizeof(char*));
		smallest = "z";
		containerPtrSublist = containerPtr;
		while (containerPtrSublist != NULL) {//find smallest student name that is not on sorted list
			if (strcmp(smallest, containerPtrSublist->student->name) > 0) {
				if(search_list(containerPtrSublist->student->name, tempList) == NULL){ 
					smallest = (char *)malloc(sizeof(char*));
					strcpy(smallest, containerPtrSublist->student->name); 
				}//check the student is on list already, if not keeptrack of it
			}
			containerPtrSublist = containerPtrSublist->next;
		}
		containerTemp = (struct container*)malloc(sizeof(struct container)); //create new memory for return list member
		containerTemp->student = copy_student(search_student(smallest));
		containerTemp->next = NULL;
		if (tempList == NULL) { //empty list case
			tempList = containerTemp;
			tempListPtr = tempList;
		}
		else { //end of list case
			tempListPtr->next = containerTemp;
			tempListPtr = tempListPtr->next;
		}
		while (containerPtr != NULL && search_list(containerPtr->student->name, tempList) != NULL) { //if the pointer to the original list is at an element that is on the new list move forward
			containerPtr = containerPtr->next; }
	}
	return tempList;
}

struct student* search_list(char* name, struct container **list) //search, but allows you specify the linked list
{
	if (list == NULL) { //empty linked list case
		return NULL;
	}
	struct container *ptr = list;
	while (ptr != NULL) {
		if (strcmp(ptr->student->name, name) == 0) {
			return ptr->student;
		}
		else
			ptr = ptr->next;
	}
	return NULL;
}

struct student* copy_student(struct student **toCopy) {
	struct student *tc = toCopy;
	struct student *tempStudent = (struct student*)malloc(sizeof(struct student));
	struct absent *tempStudentAbsentHead = NULL;
	struct absent *tempStudentAbsentPtr = NULL;
	struct absent *absentTemp = NULL; 
	struct absent *absentPtr = tc->absents;

	while (absentPtr != NULL) { //copy absent linked list;
		absentTemp = (struct absent*)malloc(sizeof(struct absent));
		strcpy(absentTemp->date, absentPtr->date);
		absentTemp->next = NULL;
		if (tempStudentAbsentHead == NULL) {
			tempStudentAbsentHead = absentTemp;
			tempStudentAbsentPtr = tempStudentAbsentHead;
		}
		else {
			tempStudentAbsentPtr->next = absentTemp;
			tempStudentAbsentPtr = tempStudentAbsentPtr->next;
		}
		absentPtr = absentPtr->next;
	}
	strcpy(tempStudent->name, tc->name);
	strcpy(tempStudent->standard, tc->standard);
	tempStudent->absents = tempStudentAbsentHead;
	return tempStudent;
}
