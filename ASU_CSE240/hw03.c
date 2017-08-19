#include <stdio.h>
#include <string.h>



#pragma warning(disable : 4996) // Visual Studio Compiler Directive



// Read before you start:
// Do not modify any part of this program that you are given. Doing so may cause you to fail automated test cases.
// You are given a partially complete program. Your job is to complete the functions in order for this program to work successfully.
// You should complete this homework assignment using Microsoft Visual Studios 2013 (or a later version).
// All instructions are given above the required functions, please read them and follow them carefully. 
// If you modify the function return types or parameters, you will fail the automated test cases.
// You can assume that all inputs are valid. Ex: If prompted for an integer, an integer will be input.
// NOTE: For this assignment, you can assume that all input characters will be lowercase characters.

// Global Macro Values. They are used to define the size of a 5 x 32 two-dimensional array of characters

#define NUM_STRINGS 5
#define STRING_LENGTH 32

// Forward Declarations

void initializeStrings(char[NUM_STRINGS][STRING_LENGTH]);
void frequency(char[NUM_STRINGS][STRING_LENGTH],char);
void remove_vowel(char[NUM_STRINGS][STRING_LENGTH]);
void swapStrings(char[STRING_LENGTH], char[STRING_LENGTH]);
void sortStrings(char[NUM_STRINGS][STRING_LENGTH]);
void printStrings(char[NUM_STRINGS][STRING_LENGTH]);


// Problem 1: initializeStrings (5 points)
// Traverse the 2D array of characters variable 'strings' (in the main program) and set all 32 characters in each of 
// the 5 char arrays to a null terminator so that there is a 5 row and 32 column 2D array full of null terminators.
// The null terminator is represented by the character value '\0' and is used to denote the end of a string.
// This will come in use later in the program when you will need to print the 2D array of characters.

void initializeStrings(char strings[NUM_STRINGS][STRING_LENGTH])
{
	for (int i = 0; i < NUM_STRINGS; i++) { 
		for (int j = 0; j < STRING_LENGTH; j++) {
			strings[i][j] = '\0';
		}
	}
}



// Problem 2: frequency (5 points)
// Traverse the 2D array of characters variable 'strings' and check the frequency of a particular letter or a search_alphabetin a string.
// In order to check the frequency, first you need to read the search_alphabet from the user.
// If the string is "hello" and the search_alphabet is l, the code will count the number of 'l's in hello.
// The output of the function for the above mentioned case will be 2.
//append that frequency value at the end of the string
//for hello the new string will be hello2

void frequency(char strings[NUM_STRINGS][STRING_LENGTH], char search_alphabet)

{
	
	for (int i = 0; i < NUM_STRINGS; i++) {
		int count = 0;
		int j;
		for (j = 0; j < STRING_LENGTH; j++) {
			if (strings[i][j] == search_alphabet) { count++; }
			if (strings[i][j] == '\0') { break; }
		}
		strings[i][j] = count+48; // +48 get us to the number section of ascii
	}

}



// Problem 3: remove_vowel (5 points)
// Traverse the 2D array of characters variable 'strings' and remove all vowels from the string.
// In order to remove all vowel characters, you need to check each letter of the string and decide whether its is a vowel. If so then remove it. If not then check the next character.
// If the string is "hello", your result will be hll.
//print the new string without vowel using problem 6.

void remove_vowel(char strings[NUM_STRINGS][STRING_LENGTH])

{
	for (int i = 0; i < NUM_STRINGS; i++) {
		int count = 0;
		int j;
		for (j = 0; j < STRING_LENGTH; j++) {
			if (strings[i][j] == 'a'|| strings[i][j] == 'e'|| strings[i][j] == 'i'|| strings[i][j] == 'o'|| strings[i][j] == 'u') { //check for vowels
				strcpy(strings[i]+j, strings[i] + j+1); //remove by concatenting over the letter
				j--; //move back to ensure that letter in front of current is checked to be a vowel
			}			
		}		
	}
}



// Problem 4: swapStrings (5 points)

// Swap the strings that are passed as parameters, this function will be used in Problem 5.

// If string1 is "hello" and string2 is "goodbye", after calling this function, string1 will be "goodbye" and string2 will be "hello".

void swapStrings(char string1[STRING_LENGTH], char string2[STRING_LENGTH])

{
	char temp[STRING_LENGTH];
	strcpy(temp, string1);
	strcpy(string1, string2);
	strcpy(string2, temp);
}



// Problem 5: sortStrings (20 points)
// Sort the 5 strings contained in the 2D character array parameter labeled "strings".
// Sort the strings based on their ASCII character value (use strcmp to compare strings).
// NOTE: You MUST incorporate your "swapStrings" function to recieve full points for this part.
// See the output provided in the word document for example input and output.

void sortStrings(char strings[NUM_STRINGS][STRING_LENGTH])

{
	char *min = &strings[0][0]; //'smallest' string from strings
	char *swap = &strings[1][0]; //used in finding min
	for (int i = 0; i < NUM_STRINGS; i++)
	{
		min = &strings[i][0]; //make min first string on unsorted strings
		for (int j = i + 1; j < NUM_STRINGS; j++)
		{
			swap = &strings[j][0]; //make swap first of unchecked strings
			if (strcmp(min, swap) > 0) //make min swap if swp is less than min
			{
				min = &strings[j][0];
			}
		}
		swapStrings(min, &strings[i][0]); // swap the min string of the unsorted section with the current string[i] being checked
	}
}



// Problem 6: printStrings (10 points)
// Traverse the 2D character array "strings" and print each of the contained strings.
// See the example outputs provided in the word document. Your output should match the example outputs.

void printStrings(char strings[NUM_STRINGS][STRING_LENGTH])
{
	for (int i = 0; i < NUM_STRINGS; i++)	{  printf("%s\n", strings[i]);	}
}



// You should study and understand how this main function works.
// Do not modify it in any way, there is no implementation needed here.

void main()

{

	char strings[NUM_STRINGS][STRING_LENGTH]; // will store 5 strings each with a max length of 32

	char search_alphabet;

	char input[STRING_LENGTH];

	initializeStrings(strings);



	printf("Assignment 3: 2D Character Arrays\n\n");



	for (int i = 0; i < NUM_STRINGS; i++)

	{

		printf("Enter the next String: "); // prompt for string
		fgets(input, sizeof(input), stdin); // store input string
		input[strlen(input) - 1] = '\0'; // convert trailing '\n' char to '\0' (null terminator)
		strcpy(strings[i], input); // copy input to 2D strings array

	}


	printf("Enter a character for checking its frequency: "); // prompt for integer

	scanf("%c", &search_alphabet); // store integer


	frequency(strings, search_alphabet);
	remove_vowel(strings);
	printf("\nThe strings after vowel removal:\n");
	printStrings(strings);

	sortStrings(strings);

	printf("\nSorted Strings:\n");

	printStrings(strings);

}
