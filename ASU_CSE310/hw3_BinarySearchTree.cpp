#include <iostream>
#include <cstdlib>

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
	void TREE_INSERT(int );
	// Added Functions
	node* TREE_DELETE(node* );
	node* SUCCESSOR(node* );
	node* REMOVE_MAX();
	node* FIND_MAX(node* );
	node* FIND_MIN(node* );
	void PRE_ORDER_TRAVERSAL(node* );
	void POST_ORDER_TRAVERSAL(node*);
	void PRINT_MAX(node*);
	node* TREE_SEARCH(node*, int);
	void PRINT_SUCCESSOR(node*);
};

void BinarySearchTree::TREE_INSERT(int d)
{
	// This implements the algorithm in page 261 of the textbook
	node* z = new node();
	z->key = d;
	z->left = NULL;
	z->right = NULL;
	z->parent = NULL;

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
		cout << " " << x->key << " ";
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
	else if(y == y->parent->left){
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

int main()
{
	BinarySearchTree bst;
	int choice, key;
	while (true)
	{
		cout << endl << endl;
		cout << " Binary Search Tree Example " << endl;
		cout << " ----------------------------- " << endl;
		cout << " 1. Insert a Node " << endl;
		cout << " 2. Pre-Order Traversal " << endl;
		cout << " 3. Post-Order Traversal " << endl;
		cout << " 4. In-Order Traversal " << endl;
		cout << " 5. Find Max " << endl;
		cout << " 6. Remove Max " << endl;
		cout << " 7. Successor " << endl;
		cout << " 8. Delete a Node " << endl;
		cout << " 9. Exit " << endl;
		cout << " Enter your choice : ";
		cin >> choice;
		switch (choice)
		{
		case 1: cout << " Enter key (int value) to be inserted : ";
			cin >> key;
			bst.TREE_INSERT(key);
			break;
		case 2: cout << endl;
			cout << " Pre-Order Traversal " << endl;
			cout << " -------------------" << endl;
			bst.PRE_ORDER_TRAVERSAL(bst.root);
			break;
		case 3: cout << endl;
			cout << " Post-Order Traversal " << endl;
			cout << " -------------------" << endl;
			bst.POST_ORDER_TRAVERSAL(bst.root);
			break;
		case 4: cout << endl;
			cout << " In-Order Traversal " << endl;
			cout << " -------------------" << endl;
			bst.INORDER_TREE_WALK(bst.root);
			break;
		case 5: cout << endl;
			cout << " Find Max " << endl;
			cout << " -------------------" << endl;
			bst.PRINT_MAX(bst.root);
			break;
		case 6: cout << endl;
			cout << " Remove Max " << endl;
			cout << " -------------------" << endl;
			cout << " Removing: " << endl;
			bst.PRINT_MAX(bst.root);
			bst.REMOVE_MAX();
			break;
		case 7: cout << endl;
			cout << " Sucessor " << endl;
			cout << " -------------------" << endl;
			cout << " Enter Key to Find: ";
			cin >> key;
			bst.PRINT_SUCCESSOR(bst.TREE_SEARCH(bst.root, key));
			break;
		case 8: cout << endl;
			cout << " Delete Node " << endl;
			cout << " -------------------" << endl;
			cout << " Enter Key to Find: ";
			cin >> key;
			bst.TREE_DELETE(bst.TREE_SEARCH(bst.root, key));
			break;
		case 9: system("pause");
			return 0;
			break;
		default:
			cout << "Invalid choice";
		}
	}
}