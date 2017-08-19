#include <iostream>
#include <cstdlib>
#include <string>

using namespace std;
const int SIZE = 1000; //modify this
const int MOD = 66; //65536/1000 ~~ 65 => 66  ||  65536/66 ~~ 992

class node {
public:
	int key;
	string name;
	double gpa;
	string aLevel;
	node* next;

	node(int k) {
		key = k;
		name = "";
		gpa = 0.0;
		aLevel = "";
		next = NULL;
	}
};

class HashTable {
private:
	node** table;

public:
	HashTable() {
		table = new node*[SIZE];
		for (int i = 0; i < SIZE; i++) { table[i] = NULL; }
	}
	int hash(int key) { return key % MOD; }
	void INSERT(node* temp) {
		int h = hash(temp->key);
		if (table[h] == NULL) {
			table[h] = temp;
		}
		else {
			temp->next = table[h];
			table[h] = temp;
		}	
	}
	void DELETE(int key) { 
		if (SEARCH(key) == NULL) { 
			cout << endl << "Key does not exist in table" << endl;
			return; 
		}
		int h = hash(key);
		node* temp = table[h];
		if (temp->key == key) {
			table[h] = table[h]->next;
			return;
		}
		node* ptr = temp;
		while (ptr->next->key != key) {
			ptr = ptr->next;
		}
		temp = ptr->next;
		ptr->next = ptr->next->next;
	}
	node* SEARCH(int key) {
		int h = hash(key);
		node* ptr = table[h];
		if (ptr == NULL) { return NULL; }
		if (ptr->key == key) {
			return ptr;
		}
		while (ptr->next != NULL) {
			if (ptr->next->key == key) { return ptr->next; }
			ptr = ptr->next;
		}
		return NULL;
	}	

};

int main() {
	HashTable htable;
	int choice, key;
	double gpa;
	string aLevel, name;
	node* temp;
	while (true) {
		cout << endl << endl;
		cout << " Hash Table " << endl;
		cout << " ----------------------------- " << endl;
		cout << " 1. Insert a Record " << endl;
		cout << " 2. Delete a Record " << endl;
		cout << " 3. Search the Table for a Record " << endl;
		cout << " 4. Exit" << endl;
		cout << " Enter your choice : ";
		cin >> choice;
		switch (choice) {
		case 1: 
			cout << endl;
			cout << " Insert Record " << endl;
			cout << " -------------------" << endl;
			cout << " Enter Key (Should bet between 0 and  65536): ";
			cin >> key;
			cout << endl << " Enter GPA ";
			cin >> gpa;
			cout << endl << " Enter Name ";
			getline(cin, name);
			cout << endl << " Enter Academic Level ";
			getline(cin, aLevel);
			temp = new node(key);
			temp->aLevel = aLevel;
			temp->name = name;
			temp->gpa = gpa;
			temp->next = NULL;
			htable.INSERT(temp);
			break;
		case 2:
			cout << endl;
			cout << " Delete Record " << endl;
			cout << " -------------------" << endl;
			cout << " Enter Key to Delete(Should bet between 0 and  65536): ";
			cin >> key;
			htable.DELETE(key);
			break;
		case 3:
			cout << endl;
			cout << " Search for a Record " << endl;
			cout << " -------------------" << endl;
			cout << " Enter Key to search for (Should bet between 0 and  65536): ";
			cin >> key;
			temp = htable.SEARCH(key);
			if (temp != NULL) {
				cout << endl << "Key: " << temp->key << endl;
				cout << endl << "Name: " << temp->name << endl;
				cout << endl << "GPA: " << temp->gpa << endl;
				cout << endl << "Academic Level: " << temp->aLevel << endl;
			}
			else
				cout << endl << "That key does not Exist" << endl;
			break;
		case 4: 
			system("pause");
			return 0;
			break;
		default:
			cout << "Invalid choice";
		}
	}

	system("pause");
	return 0;
}