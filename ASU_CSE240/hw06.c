#define _CRT_SECURE_NO_WARNINGS 0

// READ BEFORE YOU START:
// You are given a partially completed program that creates a list of students for a school.
// Each student has the corresponding information: name, gender, class, standard, and roll_number.
// To begin, you should trace through the given code and understand how it works.
// Please read the instructions above each required function and follow the directions carefully.
// If you modify any of the given code, the return types, or the parameters, you risk failing the automated test cases.
//
// The following will be accepted as input in the following format: "name:gender:standard:roll_number:tuition_fee"
// Example Input: "Tom:M:3rd:10:2000.10" or "Elsa:F:4th:15:2700"
// Valid name: String containing alphabetical letters beginning with a capital letter
// Valid gender: Char value 'M' or 'F'
// Valid standard: String containing alpha-numeric letters beginning with a number
// Valid roll_number: Positive integer value
// Valid tuition fee: Float containing no more than 2 decimal value, for example: 1500.45 or 2000.7 or 2700
// All inputs will be a valid length and no more than the allowed number of students will be added to the list

#include <stdio.h>
#include <stdlib.h>
#include <string.h>
#include <ctype.h>

// included to check for memory leaks
#define CRTDBG_MAP_ALLOC
#include <crtdbg.h>



typedef enum { male = 0, female } gender; // enumeration type gender

struct student {
	char name[30];
	gender genderValue;
	char standard[30];
	int roll_number;
	float tuition_fee;
	struct student* next;
} *list = NULL;

// forward declaration of functions
void flush();
void branching(char);
void registration(char);
int add(char*, char*, char*, int, float); // 15
struct student* search(char*); // 5
void remove_one(char*); // 10
void remove_all(struct student*); // 5
struct student* create_list_by_tuition_fee(float tuition); // 15
void display(struct student*);

int main()
{
	char ch = 'i';
	printf("Assignment 6: Linked Lists\n\n");
	printf("Student Information\n\n");

	do
	{
		printf("Please enter your selection:\n");
		printf("\ta: add a new student to the list\n");
		printf("\ts: search for a student on the list\n");
		printf("\td: display list of student\n");
		printf("\tr: remove a student from the list\n");
		printf("\tp: print list of students with at least a certain amount of tuition fee\n");
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
	case 'p': registration(c); break;
	case 'd': display(list); break;
	case 'q': break;
	default: printf("Invalid input!\n");
	}
}

// The registration function is used to determine how much information is needed and which function to send that information to.
// It uses values that are returned from some functions to produce the correct ouput.
// There is no implementation needed here, but you should study this function and know how it works.
// It is always helpful to understand how the code works before implementing new features.
// Do not change anything in this function or you risk failing the automated test cases.
void registration(char c)
{
	char input[100];

	if (c == 'a')
	{
		printf("\nPlease enter the student's information in the following format:\n");
		printf("\tname:gender:standard:roll_number:tuition_fee\n");
		fgets(input, sizeof(input), stdin);

		// discard '\n' chars attached to input
		input[strlen(input) - 1] = '\0';

		char* name = strtok(input, ":"); // strtok used to parse string
		char* genderValueString = strtok(NULL, ":");
		char* standard = strtok(NULL, ":");
		int roll_number = atoi(strtok(NULL, ":")); // atoi used to convert string to int
		float tuition_fee = atof(strtok(NULL, ":")); // atof used to convert string to float

		int result = add(name, genderValueString, standard, roll_number, tuition_fee);

		if (result == 0)
			printf("\nThat student is already on the list\n\n");
		else
			printf("\nStudent added to list successfully\n\n");
	}
	else if (c == 's' || c == 'r')
	{
		printf("\nPlease enter the student's name:\n");
		fgets(input, sizeof(input), stdin);

		// discard '\n' chars attached to input
		input[strlen(input) - 1] = '\0';

		struct student* result = search(input);

		if (result == NULL)
			printf("\nThat student is not on the list\n\n");
		else if (c == 's')
			printf("\nStandard: %s\n\n", result->standard);
		else if (c == 'r')
		{
			remove_one(input);
			printf("\nStudent removed from the list\n\n");
		}
	}
	else // c = 'p'
	{
		float tuition=0.0;

		printf("\nPlease enter a tuition amount:\n");
		scanf("%f",&tuition); getchar();

		struct student* result = create_list_by_tuition_fee(tuition);

		display(result);
		remove_all(result);
	}
}

// Q1: add (15)
// Similar to hw05, you will be inserting into a list of students sorted alphabetically by their name.
// Differing from hw05, there is no limit to how many students can be on this list.
// For this assignment, you can also assume that no 2 students will have the same name.
// NOTE: You still need to check if the input student already exists on the list.
//
// This means that if the name of the student to be added matches the name of a student on the list,
// then it is enough to assume that the student is already on the list and should not be added.
// To clarify, you will be tested to assure that a student is not added to the list twice.
//
// If the student is already on the list, do not add the student to the list AND return the integer value 0.
// If the student is not on the list, add the student to the list and return the integer value 1.
//
// "list" is initialized as NULL. Use this as your 'head' of the list and insert into it accordingly. 
// NOTE: You will need to allocate memory (malloc) for a new node to add to the linked list of students.
//
// To insert the student at sorted place, you need to consider 4 possibilities for inserting into the list:
//	- inserting into an empty list
//	- inserting at the beginning of the list
//	- inserting inbetween 2 nodes in the list
//	- inserting at the end of the list
int add(char* name, char* genderValueString, char* standard, int roll_number, float tuition_fee)
{
	if (search(name) == NULL) {
		gender a;
		if (genderValueString[0] == 'm' || genderValueString[0] == 'M') { a = male; }
		else { a = female; }
		struct student *ptr = list, *previous = 0; 
		struct student *temp = (struct student*)malloc(sizeof(struct student));
		temp->genderValue = a;
		temp->roll_number = roll_number;
		temp->tuition_fee = tuition_fee;
		strcpy(temp->name, name);
		strcpy(temp->standard, standard);
		temp->next = NULL;
		if (ptr == NULL) {//empty case
			ptr = temp;
			list = ptr;
			return 1;
		}
		if (strcmp(ptr->name, name) > 0) {//beginning case 
			temp->next = ptr;
			ptr = temp;
			list = ptr;
			return 1;
		}
		while (ptr->next != NULL) { //inside linked list case
			if (strcmp(ptr->next->name, name) > 0) {
				temp->next = ptr->next;
				ptr->next = temp;
				return 1;
			}
			else {
				previous = ptr;
				ptr = ptr->next;
			}
		}
		if (ptr->next == NULL) { //end case
			ptr->next = temp;
			return 1;
		}
	}
	return 0;
}

// Q2 : search (5 points)
// In this function, you are passed the name of a student to find its standard.
// If the student exists on the list, return a pointer to the requested student. If not, return NULL.
// (You must return a pointer to a node in your list. Do not create a pointer that just includes the standard)
// (Remember that it is enough to search for a student by only their name since no 2 students will have the same name)
struct student* search(char* name)
{
	struct student *ptr = list;
	while (ptr != NULL) {
		if (strcmp(ptr->name, name) == 0) {
			return ptr;
		}
		else
			ptr = ptr->next;
	}
	return NULL;
}

// Q3: remove_one (10)
// In this function, you are passed the name of a student to remove the corresponding student from the list.
// The search function is called before this function so you can assume that the student is on the list.
// You will need to find the student and remove it using proper memory management to ensure no memory leaks.
// (Remember that it is enough search for a student by their name since no 2 students will have the same name)
void remove_one(char* name)
{
	struct student *ptr = list, *location = 0;
	while (ptr != NULL) {
		if (strcmp(ptr->name, name) == 0) {
			break; //location is one behind ptr
		}
		else {
			location = ptr;
			ptr = ptr->next;
		}
	}
	if (location == 0) {//nothng happened in while loop
		list = list->next;
		free(ptr);
		return;
	}
	else {
		location->next = ptr->next;
		free(ptr);
		return;
	}
}

// Q4: remove_all (5)
// Recursively all of the students from the list while using proper memory management to ensure no memory leaks.
// If memory leaks are detected, the _CrtDumpMemoryLeaks() call in main will notify you in the output window.
// This function is called in main before the program terminates, you only need to implement the code.
void remove_all(struct student* students)
{
	struct student *ptr = students, *toRemove = 0;
	while (ptr != NULL) {
		toRemove = ptr;
		ptr = ptr->next;
		free(toRemove);
	}
	return;
}

// Q5: create_list_by_tuition_fee (15)
// In this function, you will read the existing linked list pointed to by head pointer "list". The function takes  
// a parameter tuition fee and will return another list of students that are of at least a certain tuition fee.
// The returned list should contain all students with a tuition fee that is greater than or equal (>=) to the parameter tuition fee.
// The returned list should still be in alphabetical order. You need to add to the returned list accordingly.
// NOTE: If you have implemented your add() function correctly, your list should already be in alphabetical order.
struct student* create_list_by_tuition_fee(float tuition)
{
	struct student *ptr = list, *tuitionList = NULL, *tuitionPtr = tuitionList;  //inialize pointer to list, make sublist head pointer, and pointer to sublist
	while (ptr != NULL) {
		if (ptr->tuition_fee >= tuition) {
			if (tuitionList == NULL) { //give head memory and add in first element
				tuitionList = (struct student*)malloc(sizeof(struct student));
				tuitionList->genderValue = ptr->genderValue;
				tuitionList->next = NULL;
				tuitionList->roll_number = ptr->roll_number;
				tuitionList->tuition_fee = ptr->tuition_fee;
				strcpy(tuitionList->name, ptr->name);
				strcpy(tuitionList->standard, ptr->standard); 
				tuitionPtr = tuitionList;
			}
			else { //add next struct into linked list through allocating memory at current structs next pointer
				tuitionPtr->next = (struct student*)malloc(sizeof(struct student));
				tuitionPtr->next->genderValue = ptr->genderValue;
				tuitionPtr->next->next = NULL;
				tuitionPtr->next->roll_number = ptr->roll_number;
				tuitionPtr->next->tuition_fee = ptr->tuition_fee;
				strcpy(tuitionPtr->next->name, ptr->name);
				strcpy(tuitionPtr->next->standard, ptr->standard);
				tuitionPtr = tuitionPtr->next;
			}
		}
		ptr = ptr->next;
	}
	return tuitionList;
}

// This function displays the list of students and the information for each one. It is already implemented for you.
// It may be helpful to trace through this function to help you complete other sections of this assignment.
void display(struct student* students)
{
	struct student* temp = students;
	char* genderValue;

	if (students == NULL)
		printf("\nThere are no students on this list!\n\n");
	else
	{
		while (temp != NULL)
		{
			printf("\nName: %s\n", temp->name);

			if (temp->genderValue == male)
				genderValue = "Male";
			else
				genderValue = "Female";

			printf("Gender: %s\n", genderValue);
			printf("Standard: %s\n", temp->standard);
			printf("Roll No: %d \n", temp->roll_number);
			printf("Tuition Fees: $%.2f \n", temp->tuition_fee);

			temp = temp->next;
		}
		printf("\n");
	}
}
