#include <string>
#include <fstream>
#include <iostream>
#include <sstream>

using namespace std;

struct student {
	string name;
	struct student *next;
	double grade;
}; 

typedef struct student student;

int main() {
	_CrtSetDbgFlag(_CRTDBG_ALLOC_MEM_DF | _CRTDBG_LEAK_CHECK_DF);

	student *head = NULL;
	student *ptr = head;
	student *temp = NULL;
	string name;
	ofstream fileWrite("output.txt");
	ifstream fileRead("students.txt");

	// Read sutdent names from file and build linked list
	if (fileRead.is_open()) {
		while (fileRead.get() != -1) {
			temp = new student;
			fileRead.unget();
			getline(fileRead, name);
			temp->name = name;
			temp->grade = 0.00;
			temp->next = NULL;

			if (head == NULL) {
				head = temp;
				ptr = head;
			}
			else {
				ptr->next = temp;
				ptr = temp;
			}
		}
	}
	else {
		cout << "Unable to read file students.txt\n";
		fileWrite.close();
		fileRead.close();

		system("Pause");
		return 0;
	}

	// Take grade input for each student and assign
	ptr = head;
	while (ptr != NULL) {
		cin >> ptr->grade;
		ptr = ptr->next;
	}
	
	// Print linked list to file
	ptr = head;
	if (fileWrite.is_open()) {
		while (ptr != NULL) {
			ostringstream buffer;
			buffer.precision(2);
			//fprintf(tempString, "%s \t %.2f\n", ptr->name.c_str(), ptr->grade);
			buffer << ptr->name << "\t" << fixed << ptr->grade << "\n";
			fileWrite << buffer.str();
			ptr = ptr->next;
		}
	}
	else {
		cout << "Unable to open file output.txt\n";
	}

	// Free linked list from memory
	while (head != NULL) {
		student *temp = head;
		head = head->next;
		delete temp;
	}

	fileWrite.close();
	fileRead.close();

	system("Pause");
	return 0;
}