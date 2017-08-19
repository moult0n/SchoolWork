#include <iostream>
#include <cstdlib>
#include <string>

using namespace std;

class BinarySearchTree
{
private:
	class node
	{
	public:
		node* left;
		node* right;
		int key;
		string data;
		node* parent;
	};


public:
	node* root;
	BinarySearchTree()
	{
		root = NULL;
	}
	bool isEmpty() const { return root == NULL; }
	void INORDER_TREE_WALK(node*);
	void TREE_INSERT(int);
	// Added Functions
	node* TREE_DELETE(node*);
	node* SUCCESSOR(node*);
	node* REMOVE_MAX();
	node* FIND_MAX(node*);
	node* FIND_MIN(node*);
	void PRE_ORDER_TRAVERSAL(node*);
	void POST_ORDER_TRAVERSAL(node*);
	void PRINT_MAX(node*);
	node* TREE_SEARCH(node*, int);
	void PRINT_SUCCESSOR(node*);
};

void BinarySearchTree::TREE_INSERT(int d)
{
	// This implements the algorithm in page 261 of the textbook
	node* z = new node();
	string data;
	z->key = d;
	z->left = NULL;
	z->right = NULL;
	z->parent = NULL;
	
	cout << " Enter Flight Number: ";
	getline(cin, data);
	getline(cin, data);
	z->data = data;

	node* y = NULL;
	node* x = root;

	while (x != NULL)
	{
		y = x;
		if (z->key < x->key)
			x = x->left;
		else
			x = x->right;
	}

	z->parent = y;
	if (y == NULL)
		root = z;
	else if (z->key < y->key)
		y->left = z;
	else
		y->right = z;

}

void BinarySearchTree::INORDER_TREE_WALK(node* x)
{
	if (x != NULL)
	{
		if (x->left) INORDER_TREE_WALK(x->left);
		cout << " " << x->key << " " << x->data << endl;
		if (x->right) INORDER_TREE_WALK(x->right);
	}


}

void BinarySearchTree::PRE_ORDER_TRAVERSAL(node* x) {
	if (x != NULL) {
		cout << " " << x->key << " ";
		if (x->left) PRE_ORDER_TRAVERSAL(x->left);
		if (x->right) PRE_ORDER_TRAVERSAL(x->right);
	}
}

void BinarySearchTree::POST_ORDER_TRAVERSAL(node* x) {
	if (x != NULL) {
		if (x->left) POST_ORDER_TRAVERSAL(x->left);
		if (x->right) POST_ORDER_TRAVERSAL(x->right);
		cout << " " << x->key << " ";
	}
}

BinarySearchTree::node* BinarySearchTree::FIND_MAX(node* x) {
	while (x->right != NULL) {
		x = x->right;
	}
	return x;
}

void BinarySearchTree::PRINT_MAX(node* x) {
	node* y = FIND_MAX(x);
	cout << " " << y->key << endl;
}

BinarySearchTree::node* BinarySearchTree::FIND_MIN(node* x) {
	while (x->left != NULL) {
		x = x->left;
	}
	return x;
}

BinarySearchTree::node* BinarySearchTree::SUCCESSOR(node* x) {
	if (x->right != NULL) {
		return BinarySearchTree::FIND_MIN(x);
	}
	node* y = x->parent;
	while (y != NULL && x == y->right) {
		x = y;
		y = y->parent;
	}
	return y;
}

BinarySearchTree::node* BinarySearchTree::TREE_DELETE(node* z) {
	node* y;
	node* x;
	if (z->left == NULL || z->right == NULL) {
		y = z;
	}
	else {
		y = SUCCESSOR(z);
	}

	if (y->left != NULL) {
		x = y->left;
	}
	else {
		x = y->right;
	}

	if (x != NULL) {
		x->parent = y->parent;
	}

	if (y->parent == NULL) {
		root = x;
	}
	else if (y == y->parent->left) {
		y->parent->left = x;
	}
	else {
		y->parent->right = x;
	}
	if (y != z) {
		z->key = y->key;
		z->data = y->data;
	}
	return y;
}

BinarySearchTree::node* BinarySearchTree::REMOVE_MAX() {
	node* x = FIND_MAX(root);
	TREE_DELETE(x);
	return x;
}

BinarySearchTree::node* BinarySearchTree::TREE_SEARCH(node* x, int k) {
	if (x == NULL || x->key == k) {
		return x;
	}
	if (k < x->key) {
		TREE_SEARCH(x->left, k);
	}
	else {
		TREE_SEARCH(x->right, k);
	}
}

void BinarySearchTree::PRINT_SUCCESSOR(node* x) {
	node* y = SUCCESSOR(x);
	cout << " Successor " << y->key << endl;
}

int main() {
	BinarySearchTree bst;
	int k, key, choice, index;

	cout << " Please Enter a Landing Constrant: ";
	cin >> k;

	while (true) {
		cout << endl << endl;
		cout << " Landing Times BST " << endl;
		cout << " ----------------------------- " << endl;
		cout << " 1. Add Landing Request " << endl;
		cout << " 2. List Landing Times and Flight Numbers " << endl;
		cout << " 3. Withdraw Landing Request " << endl;
		cout << " 4. Change Landing Constrant " << endl;
		cout << " 5. Exit " << endl;
		cout << " Enter your choice : ";
		cin >> choice;
		switch (choice) {
		case 1:
			cout << endl;
			cout << " Enter key (int value) to be inserted : ";
			cin >> key;
			index = -k;
			while (key + index <= key + k) { // is there a faster way?
				if (bst.TREE_SEARCH(bst.root, key+index) != NULL) {
					cout << " There Is a Flight Landing TO Close to This One, Retry. " << endl;
					break;
				}
				if (key + index == key + k) {
					bst.TREE_INSERT(key);
				}
				index = index + 1;
			}
			break;
		case 2:
			cout << endl;
			cout << " Print Out Flight Landing Times " << endl;
			cout << " -------------------" << endl;
			bst.INORDER_TREE_WALK(bst.root);
			break;
		case 3:
			cout << endl;
			cout << " Withdraw Landing Request " << endl;
			cout << " -------------------" << endl;
			cout << " Enter Flight Time to Find: ";
			cin >> key;
			bst.TREE_DELETE(bst.TREE_SEARCH(bst.root, key));
			break;
		case 4:
			cout << endl;
			cout << " Change Landing Constrant " << endl;
			cout << " -------------------" << endl;
			cout << " Enter new Landing Constrant: ";
			cin >> k;
			break;
		case 5:
			system("pause");
			return 0;
			break;
		default:
			cout << "Invalid choice";
		}
	}
	
	system("Pause");
	return 0;
}